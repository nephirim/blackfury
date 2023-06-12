package keeper_test

import (
	sdk "github.com/cosmos/cosmos-sdk/types"
	banktypes "github.com/cosmos/cosmos-sdk/x/bank/types"

	"github.com/nephirim/blackfury/x/tokenfactory/types"
)

func (s *KeeperTestSuite) TestGenesis() {
	genesisState := types.GenesisState{
		FactoryDenoms: []types.GenesisDenom{
			{
				Denom: "factory/black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
				AuthorityMetadata: types.DenomAuthorityMetadata{
					Admin: "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
				},
			},
			{
				Denom: "factory/black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/diff-admin",
				AuthorityMetadata: types.DenomAuthorityMetadata{
					Admin: "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
				},
			},
			{
				Denom: "factory/black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/litecoin",
				AuthorityMetadata: types.DenomAuthorityMetadata{
					Admin: "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
				},
			},
		},
	}

	s.SetupTestForInitGenesis()
	app := s.App

	// Test both with bank denom metadata set, and not set.
	for i, denom := range genesisState.FactoryDenoms {
		// hacky, sets bank metadata to exist if i != 0, to cover both cases.
		if i != 0 {
			app.BankKeeper.SetDenomMetaData(s.Ctx, banktypes.Metadata{Base: denom.GetDenom()})
		}
	}

	// check before initGenesis that the module account is nil
	tokenfactoryModuleAccount := app.AccountKeeper.GetAccount(s.Ctx, app.AccountKeeper.GetModuleAddress(types.ModuleName))
	s.Require().Nil(tokenfactoryModuleAccount)

	app.TokenFactoryKeeper.SetParams(s.Ctx, types.Params{DenomCreationFee: sdk.Coins{sdk.NewInt64Coin("ufury", 100)}})
	app.TokenFactoryKeeper.InitGenesis(s.Ctx, genesisState)

	// check that the module account is now initialized
	tokenfactoryModuleAccount = app.AccountKeeper.GetAccount(s.Ctx, app.AccountKeeper.GetModuleAddress(types.ModuleName))
	s.Require().NotNil(tokenfactoryModuleAccount)

	exportedGenesis := app.TokenFactoryKeeper.ExportGenesis(s.Ctx)
	s.Require().NotNil(exportedGenesis)
	s.Require().Equal(genesisState, *exportedGenesis)
}
