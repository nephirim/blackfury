package wasmbinding

import (
	"encoding/json"
	"os"
	"testing"

	"github.com/CosmWasm/wasmd/x/wasm/keeper"
	"github.com/CosmWasm/wasmd/x/wasm/types"
	sdk "github.com/cosmos/cosmos-sdk/types"
	govv1 "github.com/cosmos/cosmos-sdk/x/gov/types/v1"
	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"

	"github.com/nephirim/blackfury/app"
)

func TestNoStorageWithoutProposal(t *testing.T) {
	// we use default config
	blackfury, ctx := CreateTestInput(t)

	wasmKeeper := blackfury.WasmKeeper
	// this wraps wasmKeeper, providing interfaces exposed to external messages
	contractKeeper := keeper.NewDefaultPermissionKeeper(wasmKeeper)

	_, _, creator := keyPubAddr()

	// upload reflect code
	wasmCode, err := os.ReadFile("../testdata/hackatom.wasm")
	require.NoError(t, err)
	_, _, err = contractKeeper.Create(ctx, creator, wasmCode, nil)
	require.Error(t, err)
}

func storeCodeViaProposal(t *testing.T, ctx sdk.Context, blackfuryApp *app.Blackfury, addr sdk.AccAddress) {
	t.Helper()

	govKeeper := blackfuryApp.GovKeeper
	wasmCode, err := os.ReadFile("../testdata/hackatom.wasm")
	require.NoError(t, err)

	src := types.StoreCodeProposalFixture(func(p *types.StoreCodeProposal) {
		p.RunAs = addr.String()
		p.WASMByteCode = wasmCode
	})

	govAddress := govKeeper.GetGovernanceAccount(ctx).GetAddress().String()
	msgContent, err := govv1.NewLegacyContent(src, govAddress)
	require.NoError(t, err)

	// when stored
	_, err = govKeeper.SubmitProposal(ctx, []sdk.Msg{msgContent}, "testing123")
	require.NoError(t, err)

	// and proposal execute
	em := sdk.NewEventManager()
	handler := govKeeper.LegacyRouter().GetRoute(src.ProposalRoute())
	err = handler(ctx.WithEventManager(em), src)
	require.NoError(t, err)
}

func TestStoreCodeProposal(t *testing.T) {
	blackfury, ctx := CreateTestInput(t)
	myActorAddress := RandomAccountAddress()
	wasmKeeper := blackfury.WasmKeeper

	storeCodeViaProposal(t, ctx, blackfury, myActorAddress)

	// then
	cInfo := wasmKeeper.GetCodeInfo(ctx, 1)
	require.NotNil(t, cInfo)
	assert.Equal(t, myActorAddress.String(), cInfo.Creator)
	assert.True(t, wasmKeeper.IsPinnedCode(ctx, 1))

	storedCode, err := wasmKeeper.GetByteCode(ctx, 1)
	require.NoError(t, err)
	wasmCode, err := os.ReadFile("../testdata/hackatom.wasm")
	require.NoError(t, err)
	assert.Equal(t, wasmCode, storedCode)
}

type HackatomExampleInitMsg struct {
	Verifier    sdk.AccAddress `json:"verifier"`
	Beneficiary sdk.AccAddress `json:"beneficiary"`
}

func TestInstantiateContract(t *testing.T) {
	coin := sdk.NewCoin("ufury", sdk.NewInt(10000000000))
	blackfuryApp, ctx := CreateTestInput(t)
	funder := RandomAccountAddress()
	benefit, arb := RandomAccountAddress(), RandomAccountAddress()
	FundAccount(blackfuryApp.BankKeeper, ctx, funder, sdk.NewCoins(coin))

	storeCodeViaProposal(t, ctx, blackfuryApp, funder)
	contractKeeper := keeper.NewDefaultPermissionKeeper(blackfuryApp.WasmKeeper)
	codeID := uint64(1)

	initMsg := HackatomExampleInitMsg{
		Verifier:    arb,
		Beneficiary: benefit,
	}
	initMsgBz, err := json.Marshal(initMsg)
	require.NoError(t, err)

	funds := sdk.NewInt64Coin("ufury", 123456)
	_, _, err = contractKeeper.Instantiate(ctx, codeID, funder, funder, initMsgBz, "demo contract", sdk.Coins{funds})
	require.NoError(t, err)
}
