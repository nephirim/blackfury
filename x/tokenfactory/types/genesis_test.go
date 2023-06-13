package types_test

import (
	"testing"

	"github.com/stretchr/testify/require"

	"github.com/nephirim/blackfury/x/tokenfactory/types"
)

func TestGenesisState_Validate(t *testing.T) {
	for _, tc := range []struct {
		desc     string
		genState *types.GenesisState
		valid    bool
	}{
		{
			desc:     "default is valid",
			genState: types.DefaultGenesis(),
			valid:    true,
		},
		{
			desc: "valid genesis state",
			genState: &types.GenesisState{
				FactoryDenoms: []types.GenesisDenom{
					{
						Denom: "factory/fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
						AuthorityMetadata: types.DenomAuthorityMetadata{
							Admin: "fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
						},
					},
				},
			},
			valid: true,
		},
		{
			desc: "different admin from creator",
			genState: &types.GenesisState{
				FactoryDenoms: []types.GenesisDenom{
					{
						Denom: "factory/fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
						AuthorityMetadata: types.DenomAuthorityMetadata{
							Admin: "fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
						},
					},
				},
			},
			valid: true,
		},
		{
			desc: "empty admin",
			genState: &types.GenesisState{
				FactoryDenoms: []types.GenesisDenom{
					{
						Denom: "factory/fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
						AuthorityMetadata: types.DenomAuthorityMetadata{
							Admin: "",
						},
					},
				},
			},
			valid: true,
		},
		{
			desc: "no admin",
			genState: &types.GenesisState{
				FactoryDenoms: []types.GenesisDenom{
					{
						Denom: "factory/fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
					},
				},
			},
			valid: true,
		},
		{
			desc: "invalid admin",
			genState: &types.GenesisState{
				FactoryDenoms: []types.GenesisDenom{
					{
						Denom: "factory/fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
						AuthorityMetadata: types.DenomAuthorityMetadata{
							Admin: "moose",
						},
					},
				},
			},
			valid: false,
		},
		{
			desc: "multiple denoms",
			genState: &types.GenesisState{
				FactoryDenoms: []types.GenesisDenom{
					{
						Denom: "factory/fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
						AuthorityMetadata: types.DenomAuthorityMetadata{
							Admin: "",
						},
					},
					{
						Denom: "factory/fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/litecoin",
						AuthorityMetadata: types.DenomAuthorityMetadata{
							Admin: "",
						},
					},
				},
			},
			valid: true,
		},
		{
			desc: "duplicate denoms",
			genState: &types.GenesisState{
				FactoryDenoms: []types.GenesisDenom{
					{
						Denom: "factory/fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
						AuthorityMetadata: types.DenomAuthorityMetadata{
							Admin: "",
						},
					},
					{
						Denom: "factory/fury1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
						AuthorityMetadata: types.DenomAuthorityMetadata{
							Admin: "",
						},
					},
				},
			},
			valid: false,
		},
	} {
		t.Run(tc.desc, func(t *testing.T) {
			err := tc.genState.Validate()
			if tc.valid {
				require.NoError(t, err)
			} else {
				require.Error(t, err)
			}
		})
	}
}
