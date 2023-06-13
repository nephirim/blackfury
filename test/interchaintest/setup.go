package interchaintest

import (
	"github.com/strangelove-ventures/interchaintest/v5/ibc"
)

var (
	BlackfuryE2ERepo = "fanfury/blackfury-e2e"
	BlackfuryMainRepo  = "fanfury/blackfury"

	repo, version = GetDockerImageInfo()

	BlackfuryImage = ibc.DockerImage{
		Repository: repo,
		Version:    version,
		UidGid:     "1025:1025",
	}

	XccLookupImage = ibc.DockerImage{
		Repository: "blackfuryzone/xcclookup",
		Version:    "v0.4.3",
		UidGid:     "1026:1026",
	}

	ICQImage = ibc.DockerImage{
		Repository: "blackfuryzone/interchain-queries",
		Version:    "e2e",
		UidGid:     "1027:1027",
	}

	pathBlackfuryJuno   = "blackfury-juno"
	genesisWalletAmount = int64(10_000_000)
)

func createConfig() (ibc.ChainConfig, error) {
	return ibc.ChainConfig{
			Type:                "cosmos",
			Name:                "blackfury",
			ChainID:             "blackfury-2",
			Images:              []ibc.DockerImage{BlackfuryImage},
			Bin:                 "blackfuryd",
			Bech32Prefix:        "black",
			Denom:               "ufury",
			GasPrices:           "0.0ufury",
			GasAdjustment:       1.1,
			TrustingPeriod:      "112h",
			NoHostMount:         false,
			ModifyGenesis:       nil,
			ConfigFileOverrides: nil,
			EncodingConfig:      nil,
			SidecarConfigs: []ibc.SidecarConfig{
				{
					ProcessName:      "icq",
					Image:            ICQImage,
					Ports:            []string{"2112"},
					StartCmd:         []string{"interchain-queries", "run", "--home", "/var/sidecar-processes/icq"},
					PreStart:         true,
					ValidatorProcess: false,
				},
				{
					ProcessName:      "xcc",
					Image:            XccLookupImage,
					Ports:            []string{"3033"},
					StartCmd:         []string{"/xcc", "-a", "serve", "-f", "/var/sidecar/processes/xcc/config.yaml"},
					PreStart:         true,
					ValidatorProcess: false,
				},
			},
		},
		nil
}
