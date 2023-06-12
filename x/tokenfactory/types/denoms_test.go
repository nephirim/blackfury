package types_test

import (
	"testing"

	sdk "github.com/cosmos/cosmos-sdk/types"
	"github.com/stretchr/testify/require"

	cmdcfg "github.com/nephirim/blackfury/cmd/config"
	"github.com/nephirim/blackfury/x/tokenfactory/types"
)

func TestDeconstructDenom(t *testing.T) {
	config := sdk.GetConfig()
	cmdcfg.SetBech32Prefixes(config)

	for _, tc := range []struct {
		desc             string
		denom            string
		expectedSubdenom string
		err              error
	}{
		{
			desc:  "empty is invalid",
			denom: "",
			err:   types.ErrInvalidDenom,
		},
		{
			desc:             "normal",
			denom:            "factory/black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
			expectedSubdenom: "bitcoin",
		},
		{
			desc:             "multiple slashes in subdenom",
			denom:            "factory/black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin/1",
			expectedSubdenom: "bitcoin/1",
		},
		{
			desc:             "no subdenom",
			denom:            "factory/black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/",
			expectedSubdenom: "",
		},
		{
			desc:  "incorrect prefix",
			denom: "ibc/black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/bitcoin",
			err:   types.ErrInvalidDenom,
		},
		{
			desc:             "subdenom of only slashes",
			denom:            "factory/black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/////",
			expectedSubdenom: "////",
		},
		{
			desc:  "too long name",
			denom: "factory/black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj/adsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsfadsf",
			err:   types.ErrInvalidDenom,
		},
	} {
		t.Run(tc.desc, func(t *testing.T) {
			expectedCreator := "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj"
			creator, subdenom, err := types.DeconstructDenom(tc.denom)
			if tc.err != nil {
				require.ErrorContains(t, err, tc.err.Error())
			} else {
				require.NoError(t, err)
				require.Equal(t, expectedCreator, creator)
				require.Equal(t, tc.expectedSubdenom, subdenom)
			}
		})
	}
}

func TestGetTokenDenom(t *testing.T) {
	for _, tc := range []struct {
		desc     string
		creator  string
		subdenom string
		valid    bool
	}{
		{
			desc:     "normal",
			creator:  "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
			subdenom: "bitcoin",
			valid:    true,
		},
		{
			desc:     "multiple slashes in subdenom",
			creator:  "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
			subdenom: "bitcoin/1",
			valid:    true,
		},
		{
			desc:     "no subdenom",
			creator:  "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
			subdenom: "",
			valid:    true,
		},
		{
			desc:     "subdenom of only slashes",
			creator:  "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
			subdenom: "/////",
			valid:    true,
		},
		{
			desc:     "too long name",
			creator:  "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxajffffffffffffffffffffffffffffffffff",
			subdenom: ".",
			valid:    false,
		},
		{
			desc:     "subdenom is exactly max length",
			creator:  "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxaj",
			subdenom: "bitcoinfsadfsdfeadfsafwefsefsefsdfsdafasefsf",
			valid:    true,
		},
		{
			desc:     "creator is exactly max length",
			creator:  "black1ve2nremzdnu7e55khlrt2282qhh98dh4ssnxajkhanhanchaucascascascas",
			subdenom: "bitcoin",
			valid:    true,
		},
	} {
		t.Run(tc.desc, func(t *testing.T) {
			_, err := types.GetTokenDenom(tc.creator, tc.subdenom)
			if tc.valid {
				require.NoError(t, err)
			} else {
				require.Error(t, err)
			}
		})
	}
}
