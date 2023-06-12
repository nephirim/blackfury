package keeper_test

import (
	"time"

	"github.com/nephirim/blackfury/utils/addressutils"
	"github.com/nephirim/blackfury/x/interchainstaking/types"
)

func (suite *KeeperTestSuite) TestRedelegationRecordSetGetIterate() {
	blackfury := suite.GetBlackfuryApp(suite.chainA)
	ctx := suite.chainA.GetContext()

	testValidatorOne := addressutils.GenerateAddressForTestWithPrefix("cosmosvaloper")
	testValidatorTwo := addressutils.GenerateAddressForTestWithPrefix("cosmosvaloper")

	suite.SetupTest()

	records := blackfury.InterchainstakingKeeper.AllRedelegationRecords(ctx)
	suite.Require().Equal(0, len(records))

	record := types.RedelegationRecord{
		ChainId:        "cosmoshub-4",
		EpochNumber:    1,
		Source:         testValidatorOne,
		Destination:    testValidatorTwo,
		Amount:         3000,
		CompletionTime: time.Now().Add(time.Hour).UTC(),
	}

	blackfury.InterchainstakingKeeper.SetRedelegationRecord(ctx, record)

	records = blackfury.InterchainstakingKeeper.AllRedelegationRecords(ctx)

	suite.Require().Equal(1, len(records))

	recordFetched, found := blackfury.InterchainstakingKeeper.GetRedelegationRecord(ctx, "cosmoshub-4", testValidatorOne, testValidatorTwo, 1)

	suite.Require().True(found)
	suite.Require().Equal(record, recordFetched)

	allRecords := blackfury.InterchainstakingKeeper.AllRedelegationRecords(ctx)
	suite.Require().Equal(1, len(allRecords))
	allCosmosRecords := blackfury.InterchainstakingKeeper.ZoneRedelegationRecords(ctx, "cosmoshub-4")
	suite.Require().Equal(1, len(allCosmosRecords))
	allOtherChainRecords := blackfury.InterchainstakingKeeper.ZoneRedelegationRecords(ctx, "elgafar-1")
	suite.Require().Equal(0, len(allOtherChainRecords))

	blackfury.InterchainstakingKeeper.DeleteRedelegationRecord(ctx, "cosmoshub-4", testValidatorOne, testValidatorTwo, 1)

	allCosmosRecords = blackfury.InterchainstakingKeeper.AllRedelegationRecords(ctx)
	suite.Require().Equal(0, len(allCosmosRecords))
}
