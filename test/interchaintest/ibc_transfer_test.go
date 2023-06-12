package interchaintest

import (
	"context"
	"fmt"
	"testing"

	transfertypes "github.com/cosmos/ibc-go/v5/modules/apps/transfer/types"
	"github.com/strangelove-ventures/interchaintest/v5"
	"github.com/strangelove-ventures/interchaintest/v5/chain/cosmos"
	"github.com/strangelove-ventures/interchaintest/v5/ibc"
	"github.com/strangelove-ventures/interchaintest/v5/testreporter"
	"github.com/strangelove-ventures/interchaintest/v5/testutil"
	"github.com/stretchr/testify/require"
	"go.uber.org/zap/zaptest"
)

// TestBlackfuryJunoIBCTransfer spins up a Blackfury and Juno network, initializes an IBC connection between them,
// and sends an ICS20 token transfer from Blackfury->Juno and then back from Juno->Blackfury.
func TestBlackfuryJunoIBCTransfer(t *testing.T) {
	if testing.Short() {
		t.Skip()
	}

	t.Parallel()

	// Create chain factory with Blackfury and Juno
	numVals := 3
	numFullNodes := 3

	config, err := createConfig()
	require.NoError(t, err)

	cf := interchaintest.NewBuiltinChainFactory(zaptest.NewLogger(t), []*interchaintest.ChainSpec{
		{
			Name:          "blackfury",
			ChainConfig:   config,
			NumValidators: &numVals,
			NumFullNodes:  &numFullNodes,
		},
		{
			Name:          "juno",
			Version:       "v14.1.0",
			NumValidators: &numVals,
			NumFullNodes:  &numFullNodes,
			//ChainConfig: ibc.ChainConfig{
			//	GasPrices: "0.0uatom",
			//},
		},
	})

	// Get chains from the chain factory
	chains, err := cf.Chains(t.Name())
	require.NoError(t, err)

	blackfury, juno := chains[0].(*cosmos.CosmosChain), chains[1].(*cosmos.CosmosChain)

	// Create relayer factory to utilize the go-relayer
	client, network := interchaintest.DockerSetup(t)

	r := interchaintest.NewBuiltinRelayerFactory(ibc.CosmosRly, zaptest.NewLogger(t)).Build(t, client, network)

	// Create a new Interchain object which describes the chains, relayers, and IBC connections we want to use
	ic := interchaintest.NewInterchain().
		AddChain(blackfury).
		AddChain(juno).
		AddRelayer(r, "rly").
		AddLink(interchaintest.InterchainLink{
			Chain1:  blackfury,
			Chain2:  juno,
			Relayer: r,
			Path:    pathBlackfuryJuno,
		})

	rep := testreporter.NewNopReporter()
	eRep := rep.RelayerExecReporter(t)

	ctx := context.Background()

	err = ic.Build(ctx, eRep, interchaintest.InterchainBuildOptions{
		TestName:         t.Name(),
		Client:           client,
		NetworkID:        network,
		SkipPathCreation: false,

		// This can be used to write to the block database which will index all block data e.g. txs, msgs, events, etc.
		// BlockDatabaseFile: interchaintest.DefaultBlockDatabaseFilepath(),
	})
	require.NoError(t, err)

	t.Cleanup(func() {
		_ = ic.Close()
	})

	// Start the relayer
	require.NoError(t, r.StartRelayer(ctx, eRep, pathBlackfuryJuno))
	t.Cleanup(
		func() {
			err := r.StopRelayer(ctx, eRep)
			if err != nil {
				panic(fmt.Errorf("an error occurred while stopping the relayer: %s", err))
			}
		},
	)

	// Create some user accounts on both chains
	users := interchaintest.GetAndFundTestUsers(t, ctx, t.Name(), genesisWalletAmount, blackfury, juno)

	// Wait a few blocks for relayer to start and for user accounts to be created
	err = testutil.WaitForBlocks(ctx, 5, blackfury, juno)
	require.NoError(t, err)

	// Get our Bech32 encoded user addresses
	quickUser, junoUser := users[0], users[1]

	quickUserAddr := quickUser.FormattedAddress()
	junoUserAddr := junoUser.FormattedAddress()

	// Get original account balances
	blackfuryOrigBal, err := blackfury.GetBalance(ctx, quickUserAddr, blackfury.Config().Denom)
	require.NoError(t, err)
	require.Equal(t, genesisWalletAmount, blackfuryOrigBal)

	junoOrigBal, err := juno.GetBalance(ctx, junoUserAddr, juno.Config().Denom)
	require.NoError(t, err)
	require.Equal(t, genesisWalletAmount, junoOrigBal)

	// Compose an IBC transfer and send from Blackfury -> Juno
	const transferAmount = int64(1_000)
	transfer := ibc.WalletAmount{
		Address: junoUserAddr,
		Denom:   blackfury.Config().Denom,
		Amount:  transferAmount,
	}

	quickChannels, err := r.GetChannels(ctx, eRep, blackfury.Config().ChainID)
	require.NoError(t, err)

	transferTx, err := blackfury.SendIBCTransfer(ctx, quickChannels[0].ChannelID, quickUserAddr, transfer, ibc.TransferOptions{})
	require.NoError(t, err)

	blackfuryHeight, err := blackfury.Height(ctx)
	require.NoError(t, err)

	// Poll for the ack to know the transfer was successful
	_, err = testutil.PollForAck(ctx, blackfury, blackfuryHeight, blackfuryHeight+10, transferTx.Packet)
	require.NoError(t, err)

	// Get the IBC denom for ufury on Juno
	blackfuryTokenDenom := transfertypes.GetPrefixedDenom(quickChannels[0].Counterparty.PortID, quickChannels[0].Counterparty.ChannelID, blackfury.Config().Denom)
	blackfuryIBCDenom := transfertypes.ParseDenomTrace(blackfuryTokenDenom).IBCDenom()

	// Assert that the funds are no longer present in user acc on Juno and are in the user acc on Juno
	blackfuryUpdateBal, err := blackfury.GetBalance(ctx, quickUserAddr, blackfury.Config().Denom)
	require.NoError(t, err)
	require.Equal(t, blackfuryOrigBal-transferAmount, blackfuryUpdateBal)

	junoUpdateBal, err := juno.GetBalance(ctx, junoUserAddr, blackfuryIBCDenom)
	require.NoError(t, err)
	require.Equal(t, transferAmount, junoUpdateBal)

	// Compose an IBC transfer and send from Blackfury -> Juno
	transfer = ibc.WalletAmount{
		Address: quickUserAddr,
		Denom:   blackfuryIBCDenom,
		Amount:  transferAmount,
	}

	transferTx, err = juno.SendIBCTransfer(ctx, quickChannels[0].Counterparty.ChannelID, junoUserAddr, transfer, ibc.TransferOptions{})
	require.NoError(t, err)

	junoHeight, err := juno.Height(ctx)
	require.NoError(t, err)

	// Poll for the ack to know the transfer was successful
	_, err = testutil.PollForAck(ctx, juno, junoHeight, junoHeight+10, transferTx.Packet)
	require.NoError(t, err)

	// Assert that the funds are now back on Juno and not on Juno
	blackfuryUpdateBal, err = blackfury.GetBalance(ctx, quickUserAddr, blackfury.Config().Denom)
	require.NoError(t, err)
	require.Equal(t, blackfuryOrigBal, blackfuryUpdateBal)

	junoUpdateBal, err = juno.GetBalance(ctx, junoUserAddr, blackfuryIBCDenom)
	require.NoError(t, err)
	require.Equal(t, int64(0), junoUpdateBal)
}
