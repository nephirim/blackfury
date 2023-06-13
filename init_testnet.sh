KEY="samael"
KEY2="pandora"
KEY3="ares"
KEY4="jinx"
CHAINID="fanfury-1"
MONIKER="samael"
KEYRING="test"
KEYALGO="secp256k1"
LOGLEVEL="info"
# to trace evm
#TRACE="--trace"
TRACE=""

# validate dependencies are installed
command -v jq > /dev/null 2>&1 || { echo >&2 "jq not installed. More info: https://stedolan.github.io/jq/download/"; exit 1; }

# Reinstall daemon
rm -rf ~/.blackfury*
make install

# Set client config
blackfuryd config keyring-backend $KEYRING
blackfuryd config chain-id $CHAINID

# if $KEY exists it should be deleted
blackfuryd keys add $KEY --keyring-backend $KEYRING --algo $KEYALGO
blackfuryd keys add $KEY2 --keyring-backend $KEYRING --algo $KEYALGO
blackfuryd keys add $KEY3 --keyring-backend $KEYRING --algo $KEYALGO
blackfuryd keys add $KEY4 --keyring-backend $KEYRING --algo $KEYALGO


# Set moniker and chain-id for Canto (Moniker can be anything, chain-id must be an integer)
blackfuryd init $MONIKER --chain-id $CHAINID

# Change parameter token denominations to ufury
cat $HOME/.blackfuryd/config/genesis.json | jq '.app_state["staking"]["params"]["bond_denom"]="ufury"' > $HOME/.blackfuryd/config/tmp_genesis.json && mv $HOME/.blackfuryd/config/tmp_genesis.json $HOME/.blackfuryd/config/genesis.json
cat $HOME/.blackfuryd/config/genesis.json | jq '.app_state["crisis"]["constant_fee"]["denom"]="ufury"' > $HOME/.blackfuryd/config/tmp_genesis.json && mv $HOME/.blackfuryd/config/tmp_genesis.json $HOME/.blackfuryd/config/genesis.json
cat $HOME/.blackfuryd/config/genesis.json | jq '.app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="ufury"' > $HOME/.blackfuryd/config/tmp_genesis.json && mv $HOME/.blackfuryd/config/tmp_genesis.json $HOME/.blackfuryd/config/genesis.json
cat $HOME/.blackfuryd/config/genesis.json | jq '.app_state["evm"]["params"]["evm_denom"]="ufury"' > $HOME/.blackfuryd/config/tmp_genesis.json && mv $HOME/.blackfuryd/config/tmp_genesis.json $HOME/.blackfuryd/config/genesis.json
cat $HOME/.blackfuryd/config/genesis.json | jq '.app_state["inflation"]["params"]["mint_denom"]="ufury"' > $HOME/.blackfuryd/config/tmp_genesis.json && mv $HOME/.blackfuryd/config/tmp_genesis.json $HOME/.blackfuryd/config/genesis.json

# Change voting params so that submitted proposals pass immediately for testing
cat $HOME/.blackfuryd/config/genesis.json| jq '.app_state.gov.voting_params.voting_period="7200s"' > $HOME/.blackfuryd/config/tmp_genesis.json && mv $HOME/.blackfuryd/config/tmp_genesis.json $HOME/.blackfuryd/config/genesis.json


# disable produce empty block
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/create_empty_blocks = true/create_empty_blocks = false/g' $HOME/.blackfuryd/config/config.toml
  else
    sed -i 's/create_empty_blocks = true/create_empty_blocks = false/g' $HOME/.blackfuryd/config/config.toml
fi

if [[ $1 == "pending" ]]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' 's/create_empty_blocks_interval = "0s"/create_empty_blocks_interval = "30s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i '' 's/timeout_propose = "3s"/timeout_propose = "30s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i '' 's/timeout_propose_delta = "500ms"/timeout_propose_delta = "5s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i '' 's/timeout_prevote = "1s"/timeout_prevote = "10s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i '' 's/timeout_prevote_delta = "500ms"/timeout_prevote_delta = "5s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i '' 's/timeout_precommit = "1s"/timeout_precommit = "10s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i '' 's/timeout_precommit_delta = "500ms"/timeout_precommit_delta = "5s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i '' 's/timeout_commit = "5s"/timeout_commit = "150s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i '' 's/timeout_broadcast_tx_commit = "10s"/timeout_broadcast_tx_commit = "150s"/g' $HOME/.blackfuryd/config/config.toml
  else
      sed -i 's/create_empty_blocks_interval = "0s"/create_empty_blocks_interval = "30s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i 's/timeout_propose = "3s"/timeout_propose = "30s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i 's/timeout_propose_delta = "500ms"/timeout_propose_delta = "5s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i 's/timeout_prevote = "1s"/timeout_prevote = "10s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i 's/timeout_prevote_delta = "500ms"/timeout_prevote_delta = "5s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i 's/timeout_precommit = "1s"/timeout_precommit = "10s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i 's/timeout_precommit_delta = "500ms"/timeout_precommit_delta = "5s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i 's/timeout_commit = "5s"/timeout_commit = "150s"/g' $HOME/.blackfuryd/config/config.toml
      sed -i 's/timeout_broadcast_tx_commit = "10s"/timeout_broadcast_tx_commit = "150s"/g' $HOME/.blackfuryd/config/config.toml
  fi
fi

# Allocate genesis accounts (cosmos formatted addresses)

blackfuryd add-genesis-account $KEY 2000000000000ufury --keyring-backend $KEYRING
blackfuryd add-genesis-account $KEY2 2000000000000ufury --keyring-backend $KEYRING
blackfuryd add-genesis-account $KEY3 2000000000000ufury --keyring-backend $KEYRING
blackfuryd add-genesis-account $KEY4 2000000000000ufury --keyring-backend $KEYRING

# Allocate genesis accounts (investors)

blackfuryd add-genesis-account fury1jl2zcz32npjgs88vd60xv5qan5rtzh4xvrsy9m 10000000000000ufury  				  				
blackfuryd add-genesis-account fury19umlsn9fc3ytfe9s3l9dez4z2ujjljqj8pjz2f 2500000000000ufury  				
blackfuryd add-genesis-account fury1t0lzffhd5yhclj4pmhxp4h82nxfr08c5jf07xz 825000000000ufury    				
blackfuryd add-genesis-account fury120fza5vukwmaksphtqesrh4kqxf8er6ewmlj6t 4455000000000ufury    				
blackfuryd add-genesis-account fury1d03ppywn369qzajeuqs0dge29rchxteakjru0m 825000000000ufury    				
blackfuryd add-genesis-account fury1e6m3jymsgetz5vyvkvujejqufanpq8mg8wq4h3 2310000000000ufury    				
blackfuryd add-genesis-account fury1cwk4s0jtvt69mawaqsay2a9h20cgqd9hzhe0ee 11550000000000ufury  				
blackfuryd add-genesis-account fury1y0lufpa3yfnwrjk5lfz3zcl9hq6stmdhh5zn6h 353571900000ufury    				
blackfuryd add-genesis-account fury1f02wg3dawqdwjv7ak7e6vh2u6sjf5s26um7wa2 2722500000000ufury    				
blackfuryd add-genesis-account fury1ejtqghtlhauyqag8xphnkltvqjuxwl5sll63xg 353571075000ufury    				
blackfuryd add-genesis-account fury1al3k6rd4u550gcvfwd7akl032su2y2vtye0ggp 127285125000ufury    				
blackfuryd add-genesis-account fury1526zhyrd8fzdvzayct9yfnspsdp9uuqhjagyg7 554530275000ufury    
blackfuryd add-genesis-account fury1rq048x4ducr9nqze48g55x0q57e8lthx9yj46y 136714050000ufury  				
blackfuryd add-genesis-account fury1t2rkh00d000qzlyj2l2l8z5hy34a3e733fh8zw 235714050000ufury    				
blackfuryd add-genesis-account fury1czemphdmk0j9vn6gspj454p24rs5jz4gfdyvcy 136714050000ufury    		
blackfuryd add-genesis-account fury1hcgqp24ps3n09pk4ugu7tscj72q25r8rp808xg 183386775000ufury    				
blackfuryd add-genesis-account fury1gyvgpngr3saypgdud0etzj74q56vy97spup8up 113142150000ufury  			
blackfuryd add-genesis-account fury15wcg9d228whk85zf4rde7nypn09htc2gjp2k85 77738677500ufury       				
blackfuryd add-genesis-account fury10le9zwrp6x9t6xcg4ws2j8rsvggvktaj6jlah2 117386775000ufury    				
blackfuryd add-genesis-account fury1w33lkcauxeyrq8nn3f6h9cgncxuxdrzmyqke5s 1060714050000ufury    				
blackfuryd add-genesis-account fury129kdy7qdk5r4qgrenqdd6ftjjuvcc3hqxtuxey 235714050000ufury    				
blackfuryd add-genesis-account fury1vum9yv6gtd54kpgdhd37p5z097ngphlfced867 235714050000ufury    				
blackfuryd add-genesis-account fury136qxshkaf78ucuff4kdc8srw73k2x0adxdx295 447386775000ufury    				
blackfuryd add-genesis-account fury1xeve8vkkltsd9uzaqya78ywtspyc35hr6lleay 94285950000ufury    				
blackfuryd add-genesis-account fury1lldkcxprlhqknnal3w0wp2fe0mlhyzdcrfd9wg 1178571075000ufury    				
blackfuryd add-genesis-account fury1tz80tk5295jafft5njnvvxgnvcf63y3v57rpqd 471428925000ufury    				
blackfuryd add-genesis-account fury1jhpwxpadlx8ax429ljm5rrqm2pse4sgf2rrkv8 424285125000ufury    				
blackfuryd add-genesis-account fury1es9fu48yxwd9jdweaykjaf0fr7usw3x0gr6l3r 330000000000ufury    				
blackfuryd add-genesis-account fury1as8j8qhexvsc3sy0gxrfajuuggwar45cpxy0lu 99000000000ufury    				
blackfuryd add-genesis-account fury158343p7g7qlw76ph5dzvtvk5tztegz3g24p8ns 132000000000ufury    				    			  				
blackfuryd add-genesis-account fury1wknw5glel2jekejuehn4auvfs7dhqf6zl2ud2h 66000000000ufury    				
blackfuryd add-genesis-account fury14z8wsgf807e3hxuny5laaxtn0ytvcj9qs5jq87 330000000000ufury   					
blackfuryd add-genesis-account fury1ssfpxgkzt4yj0unmzx0cmrx6mhm5kl0gu5ltqe 495000000000ufury    				
blackfuryd add-genesis-account fury1clwgp88d7aq2nhk5mmwk2w82t67n3fgk9aczuv 154286250000ufury    				
blackfuryd add-genesis-account fury17w74x9vrqq4a338ssh9y9r4m9s3f6zefgphm2l 214286250000ufury    				
blackfuryd add-genesis-account fury1kah8qvju0h5g0nslsfhvznrsw0jrhnry2zm2hs 428571750000ufury    				
blackfuryd add-genesis-account fury1d4ulqc7y3pqe5lxdwv0sl7cd9qnkjturmmfhr7 5357143500000ufury    				
blackfuryd add-genesis-account fury19k85gsahz45qr86gn5t0ym7zac8nlm6v3e8wpg 107143500000ufury    				
blackfuryd add-genesis-account fury1qws9l50tvnmfx0hrek9500dzygv92rj4m7u0u0 214286250000ufury    				
blackfuryd add-genesis-account fury14zeskm5s4yz75fd4r70m37u37wfzt9lpvhf4ts 28929000000ufury    				
blackfuryd add-genesis-account fury1zy2usgrg4ywh7e3j8qychvxarp4y5shf58zdc5 21429000000ufury    				
blackfuryd add-genesis-account fury1qksggyhumezsdmeelqrvhdyh2n6nshmuehmcue 214286250000ufury    				
blackfuryd add-genesis-account fury1vmk950mvwakjef3qjjpcz9f28x3ah3q8p08kda 42857250000ufury    				
blackfuryd add-genesis-account fury1k03n5tcj6f7d6zkjp3xvl8h6hp05vprlxha9qn 642857250000ufury    				
blackfuryd add-genesis-account fury18zmgjqxa6d274achj6dmkdddys4453ta3mwcva 642857250000ufury    				
blackfuryd add-genesis-account fury1e5ag4a5wlckwzlz4wu87p6nxjp427zpmw6d6n8 214286250000ufury    				
blackfuryd add-genesis-account fury1azg0gpgatmzr60mzya9d774eude263efqvcf3m 214286250000ufury    				
blackfuryd add-genesis-account fury1tluyekggnce4js7usrs0xk06528vg99rtqkjgg 214286250000ufury    				
blackfuryd add-genesis-account fury162cxa76zpvag4a05da0yhu69awfy35w8hpr4mm 364286250000ufury    				
blackfuryd add-genesis-account fury1kfr4wznhwelzhal8gc8es67tcx4g4tsycpxuru 214286250000ufury    				
blackfuryd add-genesis-account fury1qvesqkksz3nyrys5gvlryfj8zv90pz9qjjw4qn 642857250000ufury    				
blackfuryd add-genesis-account fury1kml5p8et0j7zhqptxla74nf0gfsumcy76z8t03 2142857250000ufury    				
blackfuryd add-genesis-account fury1nthsvkmqdl4qmeg0qh40s0jrjpquncdyq84vl3 3000000000000ufury    				
blackfuryd add-genesis-account fury15y4xh9xj2lm9ll4usturv4qdugr5t0gn8mkdja 642857250000ufury    				
blackfuryd add-genesis-account fury17xdjy3t0dtqhxzlk7dxmm32j7u7krfn3xpqtg9 428571000000ufury    				
blackfuryd add-genesis-account fury12l4ehyq5qzsmvapa5a8ls9sr65q8yf080qqh6x 535714500000ufury    				
blackfuryd add-genesis-account fury1fs2yal2cs89mqnn389ap3rh5z842llfh8kdfxh 321428250000ufury    				
blackfuryd add-genesis-account fury1mhv5w6up9ltlwe7ekgfpjhd0upn4f7umdqwsmc 964285500000ufury    				
		

# Update total supply with claim values
#validators_supply=$(cat $HOME/.blackfuryd/config/genesis.json | jq -r '.app_state["bank"]["supply"][0]["amount"]')
# Bc is required to add this big numbers
# total_supply=$(bc <<< "$amount_to_claim+$validators_supply")
# total_supply=1000000000000000000000000000
# cat $HOME/.blackfuryd/config/genesis.json | jq -r --arg total_supply "$total_supply" '.app_state["bank"]["supply"][0]["amount"]=$total_supply' > $HOME/.blackfuryd/config/tmp_genesis.json && mv $HOME/.blackfuryd/config/tmp_genesis.json $HOME/.blackfuryd/config/genesis.json

echo $KEYRING
echo $KEY1
# Sign genesis transaction
blackfuryd gentx $KEY1 100000000000stake --keyring-backend $KEYRING --chain-id $CHAINID


# Collect genesis tx
blackfuryd collect-gentxs

# Run this to ensure everything worked and that the genesis file is setup correctly
blackfuryd validate-genesis

if [[ $1 == "pending" ]]; then
  echo "pending mode is on, please wait for the first block committed."
fi

# Start the node (remove the --pruning=nothing flag if historical queries are not needed)
# blackfuryd start --pruning=nothing --trace --log_level info --minimum-gas-prices=0.0001ufury --json-rpc.api eth,txpool,personal,net,debug,web3 --rpc.laddr "tcp://0.0.0.0:26657" --api.enable true
