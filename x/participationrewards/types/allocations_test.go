package types_test

import (
	"testing"

	"cosmossdk.io/math"
	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/stretchr/testify/require"

	"github.com/nephirim/quicksilver/x/participationrewards/types"
)

func TestGetRewardsAllocations(t *testing.T) {
	type args struct {
		moduleBalance math.Int
		proportions   types.DistributionProportions
	}
	tests := []struct {
		name    string
		args    args
		want    *types.RewardsAllocation
		wantErr bool
	}{
		{
			"empty_params",
			args{},
			nil,
			true,
		},
		{
			"invalid_no_balance",
			args{
				sdk.NewInt(0),
				types.DistributionProportions{
					ValidatorSelectionAllocation: sdk.MustNewDecFromStr("0.34"),
					HoldingsAllocation:           sdk.MustNewDecFromStr("0.33"),
					LockupAllocation:             sdk.MustNewDecFromStr("0.33"),
				},
			},
			nil,
			true,
		},
		{
			"invalid_proportions_gt",
			args{
				sdk.NewInt(1000000000),
				types.DistributionProportions{
					ValidatorSelectionAllocation: sdk.MustNewDecFromStr("0.5"),
					HoldingsAllocation:           sdk.MustNewDecFromStr("0.5"),
					LockupAllocation:             sdk.MustNewDecFromStr("0.5"),
				},
			},
			nil,
			true,
		},
		{
			"invalid_proportions_lt",
			args{
				sdk.NewInt(1000000000),
				types.DistributionProportions{
					ValidatorSelectionAllocation: sdk.MustNewDecFromStr("0.3"),
					HoldingsAllocation:           sdk.MustNewDecFromStr("0.3"),
					LockupAllocation:             sdk.MustNewDecFromStr("0.3"),
				},
			},
			nil,
			true,
		},
		{
			"valid",
			args{
				sdk.NewInt(1000000000),
				types.DistributionProportions{
					ValidatorSelectionAllocation: sdk.MustNewDecFromStr("0.34"),
					HoldingsAllocation:           sdk.MustNewDecFromStr("0.33"),
					LockupAllocation:             sdk.MustNewDecFromStr("0.33"),
				},
			},
			&types.RewardsAllocation{
				ValidatorSelection: sdk.NewInt(340000000),
				Holdings:           sdk.NewInt(330000000),
				Lockup:             sdk.NewInt(330000000),
			},
			false,
		},
		{
			"valid",
			args{
				sdk.NewInt(1000000000),
				types.DistributionProportions{
					ValidatorSelectionAllocation: sdk.MustNewDecFromStr("0.5"),
					HoldingsAllocation:           sdk.MustNewDecFromStr("0.25"),
					LockupAllocation:             sdk.MustNewDecFromStr("0.25"),
				},
			},
			&types.RewardsAllocation{
				ValidatorSelection: sdk.NewInt(500000000),
				Holdings:           sdk.NewInt(250000000),
				Lockup:             sdk.NewInt(250000000),
			},
			false,
		},
		{
			"valid",
			args{
				sdk.NewInt(1000000000),
				types.DistributionProportions{
					ValidatorSelectionAllocation: sdk.MustNewDecFromStr("0.6"),
					HoldingsAllocation:           sdk.MustNewDecFromStr("0.4"),
					LockupAllocation:             sdk.MustNewDecFromStr("0"),
				},
			},
			&types.RewardsAllocation{
				ValidatorSelection: sdk.NewInt(600000000),
				Holdings:           sdk.NewInt(400000000),
				Lockup:             sdk.NewInt(0),
			},
			false,
		},
		{
			"valid",
			args{
				sdk.NewInt(164133471813),
				types.DistributionProportions{
					ValidatorSelectionAllocation: sdk.MustNewDecFromStr("0.34"),
					HoldingsAllocation:           sdk.MustNewDecFromStr("0.33"),
					LockupAllocation:             sdk.MustNewDecFromStr("0.33"),
				},
			},
			&types.RewardsAllocation{
				ValidatorSelection: sdk.NewInt(55805380417),
				Holdings:           sdk.NewInt(54164045698),
				Lockup:             sdk.NewInt(54164045698),
			},
			false,
		},
		{
			"valid",
			args{
				sdk.NewInt(164133471813),
				types.DistributionProportions{
					ValidatorSelectionAllocation: sdk.MustNewDecFromStr("0.5"),
					HoldingsAllocation:           sdk.MustNewDecFromStr("0.25"),
					LockupAllocation:             sdk.MustNewDecFromStr("0.25"),
				},
			},
			&types.RewardsAllocation{
				ValidatorSelection: sdk.NewInt(82066735907),
				Holdings:           sdk.NewInt(41033367953),
				Lockup:             sdk.NewInt(41033367953),
			},
			false,
		},
		{
			"valid",
			args{
				sdk.NewInt(164133471813),
				types.DistributionProportions{
					ValidatorSelectionAllocation: sdk.MustNewDecFromStr("0.6"),
					HoldingsAllocation:           sdk.MustNewDecFromStr("0.4"),
					LockupAllocation:             sdk.MustNewDecFromStr("0"),
				},
			},
			&types.RewardsAllocation{
				ValidatorSelection: sdk.NewInt(98480083088),
				Holdings:           sdk.NewInt(65653388725),
				Lockup:             sdk.NewInt(0),
			},
			false,
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := types.GetRewardsAllocations(tt.args.moduleBalance, tt.args.proportions)
			if tt.wantErr {
				require.Error(t, err)
				require.Nil(t, got)
				t.Logf("Error: %v", err)
				return
			}

			require.NoError(t, err)
			require.NotNil(t, got)
			require.Equal(t, tt.want, got)
		})
	}
}
