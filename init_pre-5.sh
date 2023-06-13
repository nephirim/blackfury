export KEY1="struggle panic room apology luggage game screen wing want lazy famous eight robot picture wrap act uphold grab away proud music danger naive opinion"
# 
export KEY2="guard cream sadness conduct invite crumble clock pudding hole grit liar hotel maid produce squeeze return argue turtle know drive eight casino maze host"
# 
export KEY3="fuel obscure melt april direct second usual hair leave hobby beef bacon solid drum used law mercy worry fat super must ritual bring faculty"
# 
export KEY4="smooth bike pool jealous cinnamon seat tiger team canoe almost core bag fluid garbage embrace gorilla wise door toe upon present canal myth corn"
# 
export KEY5="whisper,hole,destroy,concert,shift,faculty,media,bridge,pizza,achieve,raven,sweet history lock universe second crumble clock pudding super must ritual"
# 
export KEY6="choice give picture midnight tower jewel reunion cruise history lock universe second connect employ deny poem extend shoe design siren dose dream fault opinion"
# 
export VALIDATOR_1_GENESIS_COINS=100000000000000000stake,200000000000ufury
export KEY1_GENESIS_COINS=100000000000000000stake,200000000000ufury
export KEY2_GENESIS_COINS=100000000000000000stake,200000000000ufury
export KEY3_GENESIS_COINS=100000000000000000stake,200000000000ufury
export KEY4_GENESIS_COINS=100000000000000000stake,200000000000ufury
export KEY5_GENESIS_COINS=100000000000000000stake,200000000000ufury
export KEY6_GENESIS_COINS=100000000000000000stake,200000000000ufury

KEY1="samael"
KEY2="pandora"
KEY3="orion"
KEY4="ares"
KEY5="jinx"
KEY6="atreus"
CHAINID="fanfuryd-1"
MONIKER1="samael"
MONIKER2="padora"
MONIKER3"orion"
MONIKER4="ares"
MONIKER5="jinx"
MONIKER6="atreus"
KEYRING="os"
KEYALGO="secp256k1"
LOGLEVEL="info"
# to trace evm
#TRACE="--trace"
TRACE=""

# validate dependencies are installed
command -v jq > /dev/null 2>&1 || { echo >&2 "jq not installed. More info: https://stedolan.github.io/jq/download/"; exit 1; }

# Reinstall daemon
rm -rf ~/.furyd*
make install

# Set client config
furyd config keyring-backend $KEYRING
furyd config chain-id $CHAINID

# if $KEY1 exists it should be deleted
furyd keys add $KEY1 --keyring-backend $KEYRING --algo $KEYALGO
furyd keys add $KEY2 --keyring-backend $KEYRING --algo $KEYALGO
furyd keys add $KEY3 --keyring-backend $KEYRING --algo $KEYALGO
furyd keys add $KEY4 --keyring-backend $KEYRING --algo $KEYALGO
furyd keys add $KEY5 --keyring-backend $KEYRING --algo $KEYALGO
furyd keys add $KEY6 --keyring-backend $KEYRING --algo $KEYALGO

# Set moniker and chain-id for Black (Moniker can be anything, chain-id must be an integer)
furyd init $MONIKER --chain-id $CHAINID

# Change parameter token denominations to ufury
cat $HOME/.furyd/config/genesis.json | jq '.app_state["staking"]["params"]["bond_denom"]="ufury"' > $HOME/.furyd/config/tmp_genesis.json && mv $HOME/.furyd/config/tmp_genesis.json $HOME/.furyd/config/genesis.json
cat $HOME/.furyd/config/genesis.json | jq '.app_state["crisis"]["constant_fee"]["denom"]="ufury"' > $HOME/.furyd/config/tmp_genesis.json && mv $HOME/.furyd/config/tmp_genesis.json $HOME/.furyd/config/genesis.json
cat $HOME/.furyd/config/genesis.json | jq '.app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="ufury"' > $HOME/.furyd/config/tmp_genesis.json && mv $HOME/.furyd/config/tmp_genesis.json $HOME/.furyd/config/genesis.json
cat $HOME/.furyd/config/genesis.json | jq '.app_state["evm"]["params"]["evm_denom"]="ufury"' > $HOME/.furyd/config/tmp_genesis.json && mv $HOME/.furyd/config/tmp_genesis.json $HOME/.furyd/config/genesis.json
cat $HOME/.furyd/config/genesis.json | jq '.app_state["inflation"]["params"]["mint_denom"]="ufury"' > $HOME/.furyd/config/tmp_genesis.json && mv $HOME/.furyd/config/tmp_genesis.json $HOME/.furyd/config/genesis.json

# Change voting params so that submitted proposals pass immediately for testing
cat $HOME/.furyd/config/genesis.json| jq '.app_state.gov.voting_params.voting_period="3000s"' > $HOME/.furyd/config/tmp_genesis.json && mv $HOME/.furyd/config/tmp_genesis.json $HOME/.furyd/config/genesis.json


# disable produce empty block
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/create_empty_blocks = true/create_empty_blocks = false/g' $HOME/.furyd/config/config.toml
  else
    sed -i 's/create_empty_blocks = true/create_empty_blocks = false/g' $HOME/.furyd/config/config.toml
fi

if [[ $1 == "pending" ]]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' 's/create_empty_blocks_interval = "0s"/create_empty_blocks_interval = "30s"/g' $HOME/.furyd/config/config.toml
      sed -i '' 's/timeout_propose = "3s"/timeout_propose = "30s"/g' $HOME/.furyd/config/config.toml
      sed -i '' 's/timeout_propose_delta = "500ms"/timeout_propose_delta = "5s"/g' $HOME/.furyd/config/config.toml
      sed -i '' 's/timeout_prevote = "1s"/timeout_prevote = "10s"/g' $HOME/.furyd/config/config.toml
      sed -i '' 's/timeout_prevote_delta = "500ms"/timeout_prevote_delta = "5s"/g' $HOME/.furyd/config/config.toml
      sed -i '' 's/timeout_precommit = "1s"/timeout_precommit = "10s"/g' $HOME/.furyd/config/config.toml
      sed -i '' 's/timeout_precommit_delta = "500ms"/timeout_precommit_delta = "5s"/g' $HOME/.furyd/config/config.toml
      sed -i '' 's/timeout_commit = "5s"/timeout_commit = "150s"/g' $HOME/.furyd/config/config.toml
      sed -i '' 's/timeout_broadcast_tx_commit = "10s"/timeout_broadcast_tx_commit = "150s"/g' $HOME/.furyd/config/config.toml
  else
      sed -i 's/create_empty_blocks_interval = "0s"/create_empty_blocks_interval = "30s"/g' $HOME/.furyd/config/config.toml
      sed -i 's/timeout_propose = "3s"/timeout_propose = "30s"/g' $HOME/.furyd/config/config.toml
      sed -i 's/timeout_propose_delta = "500ms"/timeout_propose_delta = "5s"/g' $HOME/.furyd/config/config.toml
      sed -i 's/timeout_prevote = "1s"/timeout_prevote = "10s"/g' $HOME/.furyd/config/config.toml
      sed -i 's/timeout_prevote_delta = "500ms"/timeout_prevote_delta = "5s"/g' $HOME/.furyd/config/config.toml
      sed -i 's/timeout_precommit = "1s"/timeout_precommit = "10s"/g' $HOME/.furyd/config/config.toml
      sed -i 's/timeout_precommit_delta = "500ms"/timeout_precommit_delta = "5s"/g' $HOME/.furyd/config/config.toml
      sed -i 's/timeout_commit = "5s"/timeout_commit = "150s"/g' $HOME/.furyd/config/config.toml
      sed -i 's/timeout_broadcast_tx_commit = "10s"/timeout_broadcast_tx_commit = "150s"/g' $HOME/.furyd/config/config.toml
  fi
fi

# Allocate genesis accounts (cosmos formatted addresses)
furyd add-genesis-account $KEY1 200000000000ufury --keyring-backend $KEYRING
furyd add-genesis-account $KEY2 200000000000ufury --keyring-backend $KEYRING
furyd add-genesis-account $KEY3 200000000000ufury --keyring-backend $KEYRING
furyd add-genesis-account $KEY4 200000000000ufury --keyring-backend $KEYRING
furyd add-genesis-account $KEY5 200000000000ufury --keyring-backend $KEYRING
furyd add-genesis-account $KEY6 200000000000ufury --keyring-backend $KEYRING

                              
# Investors
furyd add-genesis-account blackaf1jl2zcz32npjgs88vd60xv5qan5rtzh4xc3m6uu 6875000000000ufury  				
furyd add-genesis-account blackaf1jl2zcz32npjgs88vd60xv5qan5rtzh4xc3m6uu 3125000000000ufury  				
furyd add-genesis-account blackaf19umlsn9fc3ytfe9s3l9dez4z2ujjljqjnneunw 2500000000000ufury  				
furyd add-genesis-account blackaf1t0lzffhd5yhclj4pmhxp4h82nxfr08c5xmyql9 825000000000ufury --vesting-amount 275000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf120fza5vukwmaksphtqesrh4kqxf8er6e6f5vrv 4455000000000ufury --vesting-amount 1485000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1d03ppywn369qzajeuqs0dge29rchxteazqgzku 825000000000ufury --vesting-amount 275000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1e6m3jymsgetz5vyvkvujejqufanpq8mgnuttwk 2310000000000ufury --vesting-amount 770000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1cwk4s0jtvt69mawaqsay2a9h20cgqd9hk9j3q7 990000000000ufury --vesting-amount 330000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1y0lufpa3yfnwrjk5lfz3zcl9hq6stmdhrxfdrs 353571900000ufury --vesting-amount 117857300000. --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1f02wg3dawqdwjv7ak7e6vh2u6sjf5s26gf4syd 2722500000000ufury --vesting-amount 907500000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1ejtqghtlhauyqag8xphnkltvqjuxwl5std30l0 353571075000ufury --vesting-amount 117857025000. --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1al3k6rd4u550gcvfwd7akl032su2y2vtstyk3x 94285125000ufury --vesting-amount 31428375000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1526zhyrd8fzdvzayct9yfnspsdp9uuqhx0r63e 117386775000ufury --vesting-amount 39128925000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1rq048x4ducr9nqze48g55x0q57e8lthx3ketrr 70714050000ufury --vesting-amount 23571350000. --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1t2rkh00d000qzlyj2l2l8z5hy34a3e739muemf 235714050000ufury --vesting-amount 78571350000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1czemphdmk0j9vn6gspj454p24rs5jz4gal0jpr 70714050000ufury --vesting-amount 23571350000. --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1hcgqp24ps3n09pk4ugu7tscj72q25r8r44yel0 117386775000ufury --vesting-amount 39128925000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1gyvgpngr3saypgdud0etzj74q56vy97s4w2e9x 47142150000ufury --vesting-amount 15714050000. --vesting-end-time 1699574399				
furyd add-genesis-account blackaf15wcg9d228whk85zf4rde7nypn09htc2gxnpg7n 117386775000ufury --vesting-amount 39128925000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf10le9zwrp6x9t6xcg4ws2j8rsvggvktajwq5rwd 117386775000ufury --vesting-amount 39128925000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1w33lkcauxeyrq8nn3f6h9cgncxuxdrzmsja8dh 235714050000ufury --vesting-amount 78571350000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf129kdy7qdk5r4qgrenqdd6ftjjuvcc3hqjehcqr 235714050000ufury --vesting-amount 78571350000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1vum9yv6gtd54kpgdhd37p5z097ngphlfvtxere 235714050000ufury --vesting-amount 78571350000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf136qxshkaf78ucuff4kdc8srw73k2x0adjld5un 330000000000ufury --vesting-amount 110000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf136qxshkaf78ucuff4kdc8srw73k2x0adjld5un 117386775000ufury --vesting-amount 39128925000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1xeve8vkkltsd9uzaqya78ywtspyc35hrwd58yr 94285950000ufury --vesting-amount 31428650000. --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1lldkcxprlhqknnal3w0wp2fe0mlhyzdchmxmh0 1178571075000ufury --vesting-amount 392857025000. --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1tz80tk5295jafft5njnvvxgnvcf63y3vqvgle2 471428925000ufury --vesting-amount 157142975000. --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1jhpwxpadlx8ax429ljm5rrqm2pse4sgf73gg4q 235714050000ufury --vesting-amount 78571350000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1al3k6rd4u550gcvfwd7akl032su2y2vtstyk3x 176785125000ufury --vesting-amount 58928375000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1526zhyrd8fzdvzayct9yfnspsdp9uuqhx0r63e 33000000000ufury --vesting-amount 11000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1jhpwxpadlx8ax429ljm5rrqm2pse4sgf73gg4q 330000000000ufury --vesting-amount 110000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1es9fu48yxwd9jdweaykjaf0fr7usw3x0u33pgy 247500000000ufury --vesting-amount 82500000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1as8j8qhexvsc3sy0gxrfajuuggwar45c4503xm 165000000000ufury --vesting-amount 55000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf158343p7g7qlw76ph5dzvtvk5tztegz3g782e2h 99000000000ufury --vesting-amount 33000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1rq048x4ducr9nqze48g55x0q57e8lthx3ketrr 132000000000ufury --vesting-amount 44000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1cwk4s0jtvt69mawaqsay2a9h20cgqd9hk9j3q7 66000000000ufury --vesting-amount 22000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1wknw5glel2jekejuehn4auvfs7dhqf6ztchnns 1650000000000ufury --vesting-amount 550000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf14z8wsgf807e3hxuny5laaxtn0ytvcj9qyxe77e 66000000000ufury --vesting-amount 22000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1czemphdmk0j9vn6gspj454p24rs5jz4gal0jpr 330000000000ufury --vesting-amount 110000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1hcgqp24ps3n09pk4ugu7tscj72q25r8r44yel0 66000000000ufury --vesting-amount 22000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1gyvgpngr3saypgdud0etzj74q56vy97s4w2e9x 66000000000ufury --vesting-amount 22000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf15wcg9d228whk85zf4rde7nypn09htc2gxnpg7n 66000000000ufury --vesting-amount 22000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf10le9zwrp6x9t6xcg4ws2j8rsvggvktajwq5rwd 66000000000ufury --vesting-amount 22000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1ssfpxgkzt4yj0unmzx0cmrx6mhm5kl0ggx54e7 165000000000ufury --vesting-amount 55000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1w33lkcauxeyrq8nn3f6h9cgncxuxdrzmsja8dh 495000000000ufury --vesting-amount 165000000000 --vesting-end-time 1699574399				
furyd add-genesis-account 0x84E97D094C8A10aF9D6371813dE4513D0860B8Bf 825000000000ufury --vesting-amount 275000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1clwgp88d7aq2nhk5mmwk2w82t67n3fgk30nu9t 4714286250000ufury --vesting-amount 1571428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf17w74x9vrqq4a338ssh9y9r4m9s3f6zefunu9nc 154286250000ufury --vesting-amount 51428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1kah8qvju0h5g0nslsfhvznrsw0jrhnry7ss5wh 214286250000ufury --vesting-amount 71428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1526zhyrd8fzdvzayct9yfnspsdp9uuqhx0r63e 428571750000ufury --vesting-amount 142857250000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1d4ulqc7y3pqe5lxdwv0sl7cd9qnkjtur0fzf6e 107143500000ufury --vesting-amount 35714500000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf19k85gsahz45qr86gn5t0ym7zac8nlm6v9tvsc0 5357143500000ufury --vesting-amount 1785714500000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1qws9l50tvnmfx0hrek9500dzygv92rj40vh39g 107143500000ufury --vesting-amount 35714500000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf14zeskm5s4yz75fd4r70m37u37wfzt9lpc9ztjh 214286250000ufury --vesting-amount 71428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1zy2usgrg4ywh7e3j8qychvxarp4y5shfq4fnpn 28929000000ufury --vesting-amount 9643000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1qksggyhumezsdmeelqrvhdyh2n6nshmud9sx97 21429000000ufury --vesting-amount 7143000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1vmk950mvwakjef3qjjpcz9f28x3ah3q84avg56 214286250000ufury --vesting-amount 71428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1k03n5tcj6f7d6zkjp3xvl8h6hp05vprlj9kme5 42857250000ufury --vesting-amount 14285750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf18zmgjqxa6d274achj6dmkdddys4453ta9f9x46 642857250000ufury --vesting-amount 214285750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1e5ag4a5wlckwzlz4wu87p6nxjp427zpm6gxy2q 642857250000ufury --vesting-amount 214285750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1azg0gpgatmzr60mzya9d774eude263ef57nhgu 214286250000ufury --vesting-amount 71428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1tluyekggnce4js7usrs0xk06528vg99rljav30 214286250000ufury --vesting-amount 71428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf162cxa76zpvag4a05da0yhu69awfy35w8rngtzu 214286250000ufury --vesting-amount 71428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1kfr4wznhwelzhal8gc8es67tcx4g4tsyvndz6m 364286250000ufury --vesting-amount 121428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1qvesqkksz3nyrys5gvlryfj8zv90pz9qxq9te5 214286250000ufury --vesting-amount 71428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1kml5p8et0j7zhqptxla74nf0gfsumcy7wsv4kk 214286250000ufury --vesting-amount 71428750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1nthsvkmqdl4qmeg0qh40s0jrjpquncdy547jxk 642857250000ufury --vesting-amount 214285750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf15y4xh9xj2lm9ll4usturv4qdugr5t0gnnfant6 2142857250000ufury --vesting-amount 714285750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf17xdjy3t0dtqhxzlk7dxmm32j7u7krfn3jnt43z 3000000000000ufury --vesting-amount 1000000000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf12l4ehyq5qzsmvapa5a8ls9sr65q8yf08mjtfrp 642857250000ufury --vesting-amount 214285750000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1fs2yal2cs89mqnn389ap3rh5z842llfhnyxhls 428571000000ufury --vesting-amount 142857000000 --vesting-end-time 1699574399				
furyd add-genesis-account blackaf1mhv5w6up9ltlwe7ekgfpjhd0upn4f7umej9wzl 535714500000ufury --vesting-amount 178571500000 --vesting-end-time 1699574399				   
# Update total supply with claim values
#validators_supply=$(cat $HOME/.furyd/config/genesis.json | jq -r '.app_state["bank"]["supply"][0]["amount"]')
# Bc is required to add this big numbers
# total_supply=$(bc <<< "$amount_to_claim+$validators_supply")

echo $KEYRING
echo $KEY5
# Sign genesis transaction
furyd gentx $KEY5 2000000000ufury --keyring-backend $KEYRING --chain-id $CHAINID
#furyd gentx $KEY2 1000000000000000000000ufury --keyring-backend $KEYRING --chain-id $CHAINID

# Collect genesis tx
furyd collect-gentxs

# Run this to ensure everything worked and that the genesis file is setup correctly
furyd validate-genesis

if [[ $1 == "pending" ]]; then
  echo "pending mode is on, please wait for the first block committed."
fi

# Start the node (remove the --pruning=nothing flag if historical queries are not needed)
# furyd start --pruning=nothing --trace --log_level trace --minimum-gas-prices=1.000ufury --json-rpc.api eth,txpool,personal,net,debug,web3 --rpc.laddr "tcp://0.0.0.0:26657" --api.enable true --api.enabled-unsafe-cors true

