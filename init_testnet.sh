KEY1="samael"
KEY2="pandora"
KEY3="orion"
KEY4="ares"
KEY5="jinx"
KEY6="atreus"
CHAINID="fanfury-1"
MONIKER1="samael"
MONIKER2="padora"
MONIKER3="orion"
MONIKER4="ares"
MONIKER5="jinx"
MONIKER6="atreus"
KEYRING="os"
KEYALGO="secp256k1"
LOGLEVEL="info"

# validate dependencies are installed
command -v jq > /dev/null 2>&1 || { echo >&2 "jq not installed More info: https://stedolangithubio/jq/download/"; exit 1; }

# Reinstall daemon
rm -rf ~/fury*
make install

# Set client config
fury config keyring-backend $KEYRING
fury config chain-id $CHAINID

# if $KEY exists it should be deleted
fury keys add $KEY --keyring-backend $KEYRING --algo $KEYALGO
fury keys add $KEY2 --keyring-backend $KEYRING --algo $KEYALGO

# Set moniker and chain-id for Black (Moniker can be anything, chain-id must be an integer)
fury init $MONIKER --chain-id $CHAINID

# Change parameter token denominations to ufury
cat $HOME/fury/config/genesisjson | jq 'app_state["staking"]["params"]["bond_denom"]="ufury"' > $HOME/fury/config/tmp_genesisjson && mv $HOME/fury/config/tmp_genesisjson $HOME/fury/config/genesisjson
cat $HOME/fury/config/genesisjson | jq 'app_state["crisis"]["constant_fee"]["denom"]="ufury"' > $HOME/fury/config/tmp_genesisjson && mv $HOME/fury/config/tmp_genesisjson $HOME/fury/config/genesisjson
cat $HOME/fury/config/genesisjson | jq 'app_state["gov"]["deposit_params"]["min_deposit"][0]["denom"]="ufury"' > $HOME/fury/config/tmp_genesisjson && mv $HOME/fury/config/tmp_genesisjson $HOME/fury/config/genesisjson
cat $HOME/fury/config/genesisjson | jq 'app_state["evm"]["params"]["evm_denom"]="ufury"' > $HOME/fury/config/tmp_genesisjson && mv $HOME/fury/config/tmp_genesisjson $HOME/fury/config/genesisjson
cat $HOME/fury/config/genesisjson | jq 'app_state["inflation"]["params"]["mint_denom"]="ufury"' > $HOME/fury/config/tmp_genesisjson && mv $HOME/fury/config/tmp_genesisjson $HOME/fury/config/genesisjson

# Change voting params so that submitted proposals pass immediately for testing
cat $HOME/fury/config/genesisjson| jq 'app_stategovvoting_paramsvoting_period="3000s"' > $HOME/fury/config/tmp_genesisjson && mv $HOME/fury/config/tmp_genesisjson $HOME/fury/config/genesisjson


# disable produce empty block
if [[ "$OSTYPE" == "darwin"* ]]; then
    sed -i '' 's/create_empty_blocks = true/create_empty_blocks = false/g' $HOME/fury/config/configtoml
  else
    sed -i 's/create_empty_blocks = true/create_empty_blocks = false/g' $HOME/fury/config/configtoml
fi

if [[ $1 == "pending" ]]; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' 's/create_empty_blocks_interval = "0s"/create_empty_blocks_interval = "30s"/g' $HOME/fury/config/configtoml
      sed -i '' 's/timeout_propose = "3s"/timeout_propose = "30s"/g' $HOME/fury/config/configtoml
      sed -i '' 's/timeout_propose_delta = "500ms"/timeout_propose_delta = "5s"/g' $HOME/fury/config/configtoml
      sed -i '' 's/timeout_prevote = "1s"/timeout_prevote = "10s"/g' $HOME/fury/config/configtoml
      sed -i '' 's/timeout_prevote_delta = "500ms"/timeout_prevote_delta = "5s"/g' $HOME/fury/config/configtoml
      sed -i '' 's/timeout_precommit = "1s"/timeout_precommit = "10s"/g' $HOME/fury/config/configtoml
      sed -i '' 's/timeout_precommit_delta = "500ms"/timeout_precommit_delta = "5s"/g' $HOME/fury/config/configtoml
      sed -i '' 's/timeout_commit = "5s"/timeout_commit = "150s"/g' $HOME/fury/config/configtoml
      sed -i '' 's/timeout_broadcast_tx_commit = "10s"/timeout_broadcast_tx_commit = "150s"/g' $HOME/fury/config/configtoml
  else
      sed -i 's/create_empty_blocks_interval = "0s"/create_empty_blocks_interval = "30s"/g' $HOME/fury/config/configtoml
      sed -i 's/timeout_propose = "3s"/timeout_propose = "30s"/g' $HOME/fury/config/configtoml
      sed -i 's/timeout_propose_delta = "500ms"/timeout_propose_delta = "5s"/g' $HOME/fury/config/configtoml
      sed -i 's/timeout_prevote = "1s"/timeout_prevote = "10s"/g' $HOME/fury/config/configtoml
      sed -i 's/timeout_prevote_delta = "500ms"/timeout_prevote_delta = "5s"/g' $HOME/fury/config/configtoml
      sed -i 's/timeout_precommit = "1s"/timeout_precommit = "10s"/g' $HOME/fury/config/configtoml
      sed -i 's/timeout_precommit_delta = "500ms"/timeout_precommit_delta = "5s"/g' $HOME/fury/config/configtoml
      sed -i 's/timeout_commit = "5s"/timeout_commit = "150s"/g' $HOME/fury/config/configtoml
      sed -i 's/timeout_broadcast_tx_commit = "10s"/timeout_broadcast_tx_commit = "150s"/g' $HOME/fury/config/configtoml
  fi
fi

# Allocate genesis accounts (cosmos formatted addresses)
fury add-genesis-account $KEY 200000000000ufury --keyring-backend $KEYRING

                              
# Investors

fury add-genesis-account black1jl2zcz32npjgs88vd60xv5qan5rtzh4xena7na 6875000000000ufury  				
fury add-genesis-account black1jl2zcz32npjgs88vd60xv5qan5rtzh4xena7na 3125000000000ufury  				
fury add-genesis-account black19umlsn9fc3ytfe9s3l9dez4z2ujjljqjj3lcu0 2500000000000ufury  				
fury add-genesis-account black1t0lzffhd5yhclj4pmhxp4h82nxfr08c58ezysy 825000000000ufury --vesting-amount 275000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black120fza5vukwmaksphtqesrh4kqxf8er6emtjgvd 4455000000000ufury --vesting-amount 1485000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1d03ppywn369qzajeuqs0dge29rchxtearzwxea 825000000000ufury --vesting-amount 275000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1e6m3jymsgetz5vyvkvujejqufanpq8mgj7d0ph 2310000000000ufury --vesting-amount 770000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1cwk4s0jtvt69mawaqsay2a9h20cgqd9hh8540l 990000000000ufury --vesting-amount 330000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1y0lufpa3yfnwrjk5lfz3zcl9hq6stmdhzy0fv3 353571900000ufury --vesting-amount 117857300000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1f02wg3dawqdwjv7ak7e6vh2u6sjf5s26ftn5tv 2722500000000ufury --vesting-amount 907500000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1ejtqghtlhauyqag8xphnkltvqjuxwl5s20htsw 353571075000ufury --vesting-amount 117857025000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1al3k6rd4u550gcvfwd7akl032su2y2vt3fzj78 94285125000ufury --vesting-amount 31428375000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1526zhyrd8fzdvzayct9yfnspsdp9uuqh8d977c 117386775000ufury --vesting-amount 39128925000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1rq048x4ducr9nqze48g55x0q57e8lthxs5l0vz 70714050000ufury --vesting-amount 23571350000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1t2rkh00d000qzlyj2l2l8z5hy34a3e73ye6a5g 235714050000ufury --vesting-amount 78571350000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1czemphdmk0j9vn6gspj454p24rs5jz4guafkwz 70714050000ufury --vesting-amount 23571350000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1hcgqp24ps3n09pk4ugu7tscj72q25r8r5hzasw 117386775000ufury --vesting-amount 39128925000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1gyvgpngr3saypgdud0etzj74q56vy97s5vva28 47142150000ufury --vesting-amount 15714050000ufury --vesting-end-time 1699574399				
fury add-genesis-account black15wcg9d228whk85zf4rde7nypn09htc2g838v3j 117386775000ufury --vesting-amount 39128925000ufury --vesting-end-time 1699574399				
fury add-genesis-account black10le9zwrp6x9t6xcg4ws2j8rsvggvktaj0zj8pv 117386775000ufury --vesting-amount 39128925000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1w33lkcauxeyrq8nn3f6h9cgncxuxdrzm3smrzk 235714050000ufury --vesting-amount 78571350000ufury --vesting-end-time 1699574399				
fury add-genesis-account black129kdy7qdk5r4qgrenqdd6ftjjuvcc3hqnm3u0z 235714050000ufury --vesting-amount 78571350000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1vum9yv6gtd54kpgdhd37p5z097ngphlfdfqavc 235714050000ufury --vesting-amount 78571350000ufury --vesting-end-time 1699574399				
fury add-genesis-account black136qxshkaf78ucuff4kdc8srw73k2x0adnatsnj 330000000000ufury --vesting-amount 110000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black136qxshkaf78ucuff4kdc8srw73k2x0adnatsnj 117386775000ufury --vesting-amount 39128925000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1xeve8vkkltsd9uzaqya78ywtspyc35hr00jrtz 94285950000ufury --vesting-amount 31428650000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1lldkcxprlhqknnal3w0wp2fe0mlhyzdckeqlcw 1178571075000ufury --vesting-amount 392857025000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1tz80tk5295jafft5njnvvxgnvcf63y3vpwwmkt 471428925000ufury --vesting-amount 157142975000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1jhpwxpadlx8ax429ljm5rrqm2pse4sgflnwv6p 176785125000ufury --vesting-amount 78571350000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1al3k6rd4u550gcvfwd7akl032su2y2vt3fzj78 33000000000ufury --vesting-amount 58928375000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1526zhyrd8fzdvzayct9yfnspsdp9uuqh8d977c 330000000000ufury --vesting-amount 11000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1jhpwxpadlx8ax429ljm5rrqm2pse4sgflnwv6p 247500000000ufury --vesting-amount 110000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1es9fu48yxwd9jdweaykjaf0fr7usw3x0anh989 165000000000ufury --vesting-amount 82500000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1as8j8qhexvsc3sy0gxrfajuuggwar45c5kf4f6 99000000000ufury --vesting-amount 55000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black158343p7g7qlw76ph5dzvtvk5tztegz3gl9va9k 132000000000ufury --vesting-amount 33000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1rq048x4ducr9nqze48g55x0q57e8lthxs5l0vz 66000000000ufury --vesting-amount 44000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1cwk4s0jtvt69mawaqsay2a9h20cgqd9hh8540l 1650000000000ufury --vesting-amount 22000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1wknw5glel2jekejuehn4auvfs7dhqf6z263hu3 66000000000ufury --vesting-amount 550000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black14z8wsgf807e3hxuny5laaxtn0ytvcj9q9yl63c 330000000000ufury --vesting-amount 22000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1czemphdmk0j9vn6gspj454p24rs5jz4guafkwz 66000000000ufury --vesting-amount 110000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1hcgqp24ps3n09pk4ugu7tscj72q25r8r5hzasw 66000000000ufury --vesting-amount 22000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1gyvgpngr3saypgdud0etzj74q56vy97s5vva28 66000000000ufury --vesting-amount 22000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black15wcg9d228whk85zf4rde7nypn09htc2g838v3j 66000000000ufury --vesting-amount 22000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black10le9zwrp6x9t6xcg4ws2j8rsvggvktaj0zj8pv 165000000000ufury --vesting-amount 22000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1ssfpxgkzt4yj0unmzx0cmrx6mhm5kl0gfyj3kl 495000000000ufury --vesting-amount 55000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1w33lkcauxeyrq8nn3f6h9cgncxuxdrzm3smrzk 825000000000ufury --vesting-amount 165000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1clwgp88d7aq2nhk5mmwk2w82t67n3fgksd4c22 154286250000ufury --vesting-amount 275000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black17w74x9vrqq4a338ssh9y9r4m9s3f6zefa36pue 214286250000ufury --vesting-amount 1571428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1kah8qvju0h5g0nslsfhvznrsw0jrhnryljkspk 428571750000ufury --vesting-amount 51428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1526zhyrd8fzdvzayct9yfnspsdp9uuqh8d977c 107143500000ufury --vesting-amount 71428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1d4ulqc7y3pqe5lxdwv0sl7cd9qnkjturwtyd4c 5357143500000ufury --vesting-amount 142857250000ufury --vesting-end-time 1699574399				
fury add-genesis-account black19k85gsahz45qr86gn5t0ym7zac8nlm6vyf25hw 107143500000ufury --vesting-amount 35714500000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1qws9l50tvnmfx0hrek9500dzygv92rj4ww342f 214286250000ufury --vesting-amount 1785714500000ufury --vesting-end-time 1699574399				
fury add-genesis-account black14zeskm5s4yz75fd4r70m37u37wfzt9lpe8y0ak 28929000000ufury --vesting-amount 35714500000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1zy2usgrg4ywh7e3j8qychvxarp4y5shfph0hwj 21429000000ufury --vesting-amount 71428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1qksggyhumezsdmeelqrvhdyh2n6nshmuv8kz2l 214286250000ufury --vesting-amount 9643000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1vmk950mvwakjef3qjjpcz9f28x3ah3q85l2vmm 42857250000ufury --vesting-amount 7143000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1k03n5tcj6f7d6zkjp3xvl8h6hp05vprln8slk4 642857250000ufury --vesting-amount 71428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black18zmgjqxa6d274achj6dmkdddys4453taytrz6m 642857250000ufury --vesting-amount 14285750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1e5ag4a5wlckwzlz4wu87p6nxjp427zpmm2qq9p 214286250000ufury --vesting-amount 214285750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1azg0gpgatmzr60mzya9d774eude263ef4u4n8a 214286250000ufury --vesting-amount 214285750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1tluyekggnce4js7usrs0xk06528vg99r7smg7w 214286250000ufury --vesting-amount 71428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black162cxa76zpvag4a05da0yhu69awfy35w8z3w0da 364286250000ufury --vesting-amount 71428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1kfr4wznhwelzhal8gc8es67tcx4g4tsyd3tx46 214286250000ufury --vesting-amount 71428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1qvesqkksz3nyrys5gvlryfj8zv90pz9q8zr0k4 642857250000ufury --vesting-amount 121428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1kml5p8et0j7zhqptxla74nf0gfsumcy70j23eh 2142857250000ufury --vesting-amount 71428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1nthsvkmqdl4qmeg0qh40s0jrjpquncdy4hckfh 3000000000000ufury --vesting-amount 71428750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black15y4xh9xj2lm9ll4usturv4qdugr5t0gnjtmhym 642857250000ufury --vesting-amount 214285750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black17xdjy3t0dtqhxzlk7dxmm32j7u7krfn3n3d37r 428571000000ufury --vesting-amount 714285750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black12l4ehyq5qzsmvapa5a8ls9sr65q8yf086sddvq 535714500000ufury --vesting-amount 1000000000000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1fs2yal2cs89mqnn389ap3rh5z842llfhjxqns3 321428250000ufury --vesting-amount 214285750000ufury --vesting-end-time 1699574399				
fury add-genesis-account black1mhv5w6up9ltlwe7ekgfpjhd0upn4f7umcsr2d7 964285500000ufury --vesting-amount 142857000000ufury --vesting-end-time 1699574399									

# Blackdragon

fury add-genesis-account black1797slhn49lfmgn42vwjh6c6nrxq7k34nplujzd 225250739726027ufury --vesting-amount 151889260273973ufury --vesting-end-time 1699574399				
fury add-genesis-account black10h7ln638jkn55h5wfk2enyszhtv3nf3hn0czwg 218029863013699ufury --vesting-amount 147020136986301ufury --vesting-end-time 1699574399				
fury add-genesis-account black1wexz2r5g6rsphka9qqvsqsaalc4shw7hwwr3f0 410562684931507ufury --vesting-amount 276847315068493ufury --vesting-end-time 1699574399				
fury add-genesis-account black13pqlfc4wesmfwg0mh224khsy9nrek2e357spsv 217743178082192ufury --vesting-amount 146826821917808ufury --vesting-end-time 1699574399				
fury add-genesis-account black1gwqvuzl4xwfwaxacygqkrux4dpgsl4duuw2ww7 171186739726027ufury --vesting-amount 115433260273973ufury --vesting-end-time 1699574399				
fury add-genesis-account black1kusnsv5evmtujdvr2hvr5chs9aen0gwydh944v 300338301369863ufury --vesting-amount 202521698630137ufury --vesting-end-time 1699574399				
fury add-genesis-account black1dkmehpuc582evv2uq70kt0jptpehu3yr5ymv9p 203480602739726ufury --vesting-amount 137209397260274ufury --vesting-end-time 1699574399				
fury add-genesis-account black122nwk3z6e4yeh4aj4xad3jmjy38h8jw8wlmmfm 450513424657534ufury --vesting-amount 303786575342466ufury --vesting-end-time 1699574399				
fury add-genesis-account black14lkxkdlrmvv732vhygeev95tmerxec6akxdapz 450507452054795ufury --vesting-amount 303782547945205ufury --vesting-end-time 1699574399				
fury add-genesis-account black13fdh9uey7t0hxvg825gdfdx346z7wsq2g7a8yx 218160663013699ufury --vesting-amount 147108336986301ufury --vesting-end-time 1699574399				
fury add-genesis-account black1nrye3zfvs7l438n6l56avnnzm6f00me8fmln2y 514748767123288ufury --vesting-amount 347101232876712ufury --vesting-end-time 1699574399				
fury add-genesis-account black1q97lwrj563g8ccfm6kl9zxndf860v60ejxfx0z 109023890410959ufury --vesting-amount 735161095890411ufury --vesting-end-time 1699574399				
fury add-genesis-account black1797slhn49lfmgn42vwjh6c6nrxq7k34nplujzd 600664657534247ufury --vesting-amount 405035342465753ufury --vesting-end-time 1699574399				
fury add-genesis-account black17mrjke5ra03hqnh7tlk265xlj2asz9la8mndgy 300338301369863ufury --vesting-amount 202521698630137ufury --vesting-end-time 1699574399				
fury add-genesis-account black1q84cgldq5wf3am3tfuz2lzzx2azala64fnyhwm 300338301369863ufury --vesting-amount 202521698630137ufury --vesting-end-time 1699574399				
fury add-genesis-account black1unwqjxcwv95jfu3nt89ky8zqh39xpqvwj0789g 108874575342466ufury --vesting-amount 734154246575342ufury --vesting-end-time 1699574399				
fury add-genesis-account black17parq8q75sr2cejrnrurtt7emfrc35a0skm9lm 53932602739726ufury --vesting-amount 36367397260274ufury --vesting-end-time 1699574399				
fury add-genesis-account black199jfnv587vy4f63gn6t2t4dae42prk242cjfyw 300338301369863ufury --vesting-amount 202521698630137ufury --vesting-end-time 1699574399				
fury add-genesis-account black154sksmrrrveqcdavk4ugyxmwlmdepdg0z8xdcp 300481643835616ufury --vesting-amount 202618356164384ufury --vesting-end-time 1699574399				
fury add-genesis-account black1q5cddxnk7yqxc4fjfmnpxhygkcl3uw6s7y6efz 559208821917808ufury --vesting-amount 377081178082192ufury --vesting-end-time 1699574399				
fury add-genesis-account black1lw0ruyesylglsu6m7dhefw4vfh8l8qweaaxetm 750875616438356ufury --vesting-amount 506324383561644ufury --vesting-end-time 1699574399				
fury add-genesis-account black1zm3z7dd4ee8vfxu82lfmma4wmcnt3z8739xj4m 830430684931507ufury --vesting-amount 559969315068493ufury --vesting-end-time 1699574399				
fury add-genesis-account black1wackempnenwpzkywav6hnmdckqmthv30a7gata 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black1cnzy6g0vet3ykdhk2xgvkvc350d3gke4g72lh2 109016126027397ufury --vesting-amount 735108739726027ufury --vesting-end-time 1699574399				
fury add-genesis-account black1r9764rmspkpy0qxx5myxq0kz90dukjna5lvjcl 750815890410959ufury --vesting-amount 506284109589041ufury --vesting-end-time 1699574399				
fury add-genesis-account black1nk2rycxdgl5gxtd0hpncprwfp0lzeafwaf37tv 140857863013699ufury --vesting-amount 949821369863014ufury --vesting-end-time 1699574399				
fury add-genesis-account black1nhhvjlq376f4gz6jvptsgv665vr3ss4qmzctxz 225250739726027ufury --vesting-amount 151889260273973ufury --vesting-end-time 1699574399				
fury add-genesis-account black16kgjjvhq9s07l639ylpc6sfp4cp6ze8hfswmrt 600664657534247ufury --vesting-amount 405035342465753ufury --vesting-end-time 1699574399				
fury add-genesis-account black1aqqskedu4zgmjqhpztjqzd7g8sfyzya2wn9pfe 225250739726027ufury --vesting-amount 151889260273973ufury --vesting-end-time 1699574399				
fury add-genesis-account black1fdgys6er5ak4syqgvc8uswcedjwknh6q0khh0u 213723616438356ufury --vesting-amount 144116383561644ufury --vesting-end-time 1699574399				
fury add-genesis-account black1e5pkymea4jlcmnzvrycc97jfhdzcvpd3qqyrjz 450585095890411ufury --vesting-amount 303834904109589ufury --vesting-end-time 1699574399				
fury add-genesis-account black18rp5vnjsswdazjvrdy2lj4cass9z29h5054c6r 66839397260274ufury --vesting-amount 45070602739726ufury --vesting-end-time 1699574399				
fury add-genesis-account black1ty8uvzrhy5taa4auc9h9c02x0zfugu0jg2l6ts 15058842739726ufury --vesting-amount 10154357260274ufury --vesting-end-time 1699574399				
fury add-genesis-account black1dn8yt2pe62a9nz964vmj2pwreljxehxcfxm7dz 150168553424658ufury --vesting-amount 101260446575342ufury --vesting-end-time 1699574399				
fury add-genesis-account black16qt98ac36dtaaxr7axu67z68ue8pjpdcnw6whe 37693095890411ufury --vesting-amount 25416904109589ufury --vesting-end-time 1699574399				
fury add-genesis-account black1hwapfpynu0evhdvhnge6929eu0hrpj5pwmhh0u 637981479452055ufury --vesting-amount 430198520547945ufury --vesting-end-time 1699574399				
fury add-genesis-account black145wnzde7ak68zm49yhgyc0apxpj6gwje8kvfhy 120951178082192ufury --vesting-amount 815588219178082ufury --vesting-end-time 1699574399				
fury add-genesis-account black12u9t55uxfmkd8c4mzpeatvnjmyvuj5gent3z4d 113064953424658ufury --vesting-amount 762410465753425ufury --vesting-end-time 1699574399				
fury add-genesis-account black1xsmep764kqh3fq4rq7yp7t3qgnjycp9lf349ud 339972493150685ufury --vesting-amount 229247506849315ufury --vesting-end-time 1699574399				
fury add-genesis-account black16k7xarsvqf7vv0qhu520rmarpt40g6jtzcng42 225252531506849ufury --vesting-amount 151890468493151ufury --vesting-end-time 1699574399				
fury add-genesis-account black1zejc6j533jjgzj64munsps257sa95282688yeq 136653150684932ufury --vesting-amount 921468493150685ufury --vesting-end-time 1699574399				
fury add-genesis-account black1wypy5jw7xz0lkrz3ky538vr4e7seuvs9qsc6lr 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black19frtd7huz6zrefnz3zl64z6q8r9wkt3paa7rge 109125424657534ufury --vesting-amount 735845753424658ufury --vesting-end-time 1699574399				
fury add-genesis-account black1lqseqddsce3yu5wa7atf8feqqfyn3lcmgludn8 142502120547945ufury --vesting-amount 960908794520548ufury --vesting-end-time 1699574399				
fury add-genesis-account black1elhw3cct0jgxvf2tw5yrrkc6u02shg8z5nea6x 450513424657534ufury --vesting-amount 303786575342466ufury --vesting-end-time 1699574399				
fury add-genesis-account black19rn5vwga60kun3j38taxd26cm7lelgda5d6432 109788383561644ufury --vesting-amount 740316164383562ufury --vesting-end-time 1699574399				
fury add-genesis-account black1htxf0fcfmyxyw8stjw38jz2s3muh3q6yslepur 109322520547945ufury --vesting-amount 737174794520548ufury --vesting-end-time 1699574399				
fury add-genesis-account black1ymtq3eyk2s6q44phkqv8k35jqve52d0ztat3zv 150312493150685ufury --vesting-amount 101357506849315ufury --vesting-end-time 1699574399				
fury add-genesis-account black169qmwy36jkhfzjdft3ptqqmj2zgkc3tv8dcywt 450507452054795ufury --vesting-amount 303782547945205ufury --vesting-end-time 1699574399				
fury add-genesis-account black1w6pktm54f5zgq032xxacc3ylme98t560mcjfw8 750875616438356ufury --vesting-amount 506324383561644ufury --vesting-end-time 1699574399				
fury add-genesis-account black1zjvwyksf9vnk0dwxx3n8m9xlw6pglnf0a44jtv 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black1zurjhfcc5365dsy58unk6rnh9nltfsqqnhtg5h 150169150684932ufury --vesting-amount 101260849315069ufury --vesting-end-time 1699574399				
fury add-genesis-account black134fwqahtfrg0zfr8x2su46fmrwme5mzw09n6sw 932562191780822ufury --vesting-amount 628837808219178ufury --vesting-end-time 1699574399				
fury add-genesis-account black1mgmcztfm8vvmfdmtlzk3n523vqm275j7846w9v 123316328767123ufury --vesting-amount 831536712328767ufury --vesting-end-time 1699574399				
fury add-genesis-account black1r0afwj9krzmwsadjm6l6y7mlnq6l7px0mwte4j 843331506849315ufury --vesting-amount 568668493150685ufury --vesting-end-time 1699574399				
fury add-genesis-account black1acd5nzld4f3c268cax90lk6he7m2w5ml09dvtg 150163178082192ufury --vesting-amount 101256821917808ufury --vesting-end-time 1699574399				
fury add-genesis-account black1lmw6wtyk0w6zg6jh05z4t5l7amvsalappdjuvs 300362191780822ufury --vesting-amount 202537808219178ufury --vesting-end-time 1699574399				
fury add-genesis-account black1wxvs6du63g8nmm5jpd3lzgwl6mqv0je9a2cy3e 112625369863014ufury --vesting-amount 759446301369863ufury --vesting-end-time 1699574399				
fury add-genesis-account black17zjpts3cd35tesmwrunkynygyw7fuamsah7z7s 713307945205479ufury --vesting-amount 480992054794521ufury --vesting-end-time 1699574399				
fury add-genesis-account black1ygqgkduw25g5uezflw4gnsm4n2yvawkmypfs4z 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black1zjydgdhd8uk4u29tq2e68j7kmqxrk3vsc9dfya 109017917808219ufury --vesting-amount 735120821917808ufury --vesting-end-time 1699574399				
fury add-genesis-account black1x60g2u04z7jzdnjf3znfdcxa9ut5kufq2p7qp9 301947917808219ufury --vesting-amount 203607082191781ufury --vesting-end-time 1699574399				
fury add-genesis-account black15tmdfth2kmmaedag9sk7j0nw4herj39a3vzk89 135151638356164ufury --vesting-amount 911343616438356ufury --vesting-end-time 1699574399				
fury add-genesis-account black1r4w3ae4vuyatckn8pahvexl4kpvmndreu4jnc2 600664657534247ufury --vesting-amount 405035342465753ufury --vesting-end-time 1699574399				
fury add-genesis-account black19j5upjz972gh24890tn6mpf4gzqdk09ajul5va 750815890410959ufury --vesting-amount 506284109589041ufury --vesting-end-time 1699574399				
fury add-genesis-account black1cg3e7sfxkunmwgfsrqj3caju9aheuzlzw8nq9q 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black1ca6vj94jtn5v57prr826ncskrm0reateduhe5c 622811068493151ufury --vesting-amount 419968931506849ufury --vesting-end-time 1699574399				
fury add-genesis-account black1ltk76ycjtz05j7ww7yznrr5cn5kz58za9lk7ge 150169150684932ufury --vesting-amount 101260849315069ufury --vesting-end-time 1699574399				
fury add-genesis-account black1y26ufq905uy0s27ftujamqm5y8gdys8depwtsa 150169150684932ufury --vesting-amount 101260849315069ufury --vesting-end-time 1699574399				
fury add-genesis-account black122phsq2td9x3cv9pwszse3f69smfhhncxa778a 52558904109589ufury --vesting-amount 35441095890411ufury --vesting-end-time 1699574399				
fury add-genesis-account black1vv6rsgxqh4hyxtt6dt4rmv4a93n7amjtqzzfnj 113706410958904ufury --vesting-amount 766735890410959ufury --vesting-end-time 1699574399				
fury add-genesis-account black14cyvvq5nptglnjy2hg9ky6r26349v73nu7v0kl 315353424657534ufury --vesting-amount 212646575342466ufury --vesting-end-time 1699574399				
fury add-genesis-account black1clseqnswluj79tzpng60sqhy3nf7pz0her3d0p 450513424657534ufury --vesting-amount 303786575342466ufury --vesting-end-time 1699574399				
fury add-genesis-account black1vvgh02zkh4qf9hydk0walw9nyx4udemrx5pp6g 187408328767123ufury --vesting-amount 126371671232877ufury --vesting-end-time 1699574399				
fury add-genesis-account black1ecm2vqdexfqy6kfpwdxxpl37vy289pmhj5slp2 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black1je5w89kn456ctj7fd3y4w4rf3f7klj6xkya4wj 300475671232877ufury --vesting-amount 202614328767123ufury --vesting-end-time 1699574399				
fury add-genesis-account black1yuqgnfuavv2wf6lpsr0w6wqed9d7grzal2nwpz 319253534246575ufury --vesting-amount 215276465753425ufury --vesting-end-time 1699574399				
fury add-genesis-account black129kdy7qdk5r4qgrenqdd6ftjjuvcc3hqnm3u0z 600670630136986ufury --vesting-amount 405039369863014ufury --vesting-end-time 1699574399				
fury add-genesis-account black10d4udrt2md9dzeqfaytkdhcd9utsmvxk6yf0w0 52558904109589ufury --vesting-amount 35441095890411ufury --vesting-end-time 1699574399				
fury add-genesis-account black108gy2rzhx27jj96argmgpesvlj9ur6k87flc3n 108886520547945ufury --vesting-amount 734234794520548ufury --vesting-end-time 1699574399				
fury add-genesis-account black1le8x5sn43nxn0sz5vuze509sea70sc6j3slwt3 52558904109589ufury --vesting-amount 35441095890411ufury --vesting-end-time 1699574399				
fury add-genesis-account black1xvf0jjf9vkqz40rdlmm67cfhlzcwu520rrmyj6 150169150684932ufury --vesting-amount 101260849315069ufury --vesting-end-time 1699574399				
fury add-genesis-account black1tu4g3fpx9282y2ejt6zv6m9geq97mym5t07t8g 810900273972603ufury --vesting-amount 546799726027397ufury --vesting-end-time 1699574399				
fury add-genesis-account black168q4t94pxq97fy8vqenc6fx3znc7p8fes52vsx 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black1fzd65shhhkl7d3g2f5377fufd4k9adn258nctl 180199397260274ufury --vesting-amount 121510602739726ufury --vesting-end-time 1699574399				
fury add-genesis-account black1yafjl2890r3gn38dc7ksp5r6vnfmy8ud2ecxau 125114082191781ufury --vesting-amount 843659178082192ufury --vesting-end-time 1699574399				
fury add-genesis-account black1l52awqe7p8r9mmpm27c5avywt9urqdpdskn6fa 52558904109589ufury --vesting-amount 35441095890411ufury --vesting-end-time 1699574399				
fury add-genesis-account black1fqtp07xjqwx2my5n42vcwufu6hc70zw4wwr9sf 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black18ws6vgl6w84qcs0wncup25va9ze88852cn5f5m 210235616438356ufury --vesting-amount 141764383561644ufury --vesting-end-time 1699574399				
fury add-genesis-account black1vu2p0zta4lg4fsdv777ugmajyvqrcsljwyhf2x 600664657534247ufury --vesting-amount 405035342465753ufury --vesting-end-time 1699574399				
fury add-genesis-account black1wltvdtjdnpe6uh5adg0m7ydy8cle8wwyre46mt 150294575342466ufury --vesting-amount 101345424657534ufury --vesting-end-time 1699574399				
fury add-genesis-account black12m90u3cetug08frawfu0p6jd96s354xdth00dw 150169150684932ufury --vesting-amount 101260849315069ufury --vesting-end-time 1699574399				
fury add-genesis-account black1pm350tzyg0rvvma7e43ezz729yxa5ljurrgs5c 138711309589041ufury --vesting-amount 935346904109589ufury --vesting-end-time 1699574399				
fury add-genesis-account black1pm3pva53gv4nnhvmduuh322pjmxv98t6lj3ayq 150270684931507ufury --vesting-amount 101329315068493ufury --vesting-end-time 1699574399				
fury add-genesis-account black1y2l7gnylqw3yp6u52tfgxuk0klx5uyms50tv9e 600670630136986ufury --vesting-amount 405039369863014ufury --vesting-end-time 1699574399				
fury add-genesis-account black1gyv42pg4j790wlqt5muge7pe9d9xdw7rw0tt4d 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black1klfd2u30qakx8qeqcw0xdcc3p3djq7ht727787 29692794520548ufury --vesting-amount 200222054794521ufury --vesting-end-time 1699574399				
fury add-genesis-account black145tk8ry9gzmr5jyn96pznfanadxqrvmp62gewy 217934301369863ufury --vesting-amount 146955698630137ufury --vesting-end-time 1699574399				
fury add-genesis-account black17tc5dxkejps3adusaluzu7xn9jmg7qmwuem7gd 150169150684932ufury --vesting-amount 101260849315069ufury --vesting-end-time 1699574399				
fury add-genesis-account black170k6xd7atru2uzmnqy345gyr5xcw8ke750tqpf 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black1xe7fkxfkl882uua6zyjadv296umtxdyk773ftg 600664657534247ufury --vesting-amount 405035342465753ufury --vesting-end-time 1699574399				
fury add-genesis-account black1kxyzha73fnrzd8sf3a44dnl89whrvkdyum7s87 450513424657534ufury --vesting-amount 303786575342466ufury --vesting-end-time 1699574399				
fury add-genesis-account black14z20ghpgxayvll6ppz9m4pxp939tx2uz6325w5 150169150684932ufury --vesting-amount 101260849315069ufury --vesting-end-time 1699574399				
fury add-genesis-account black1cuazcgw2m3x5r9gkyusrugn50wee4t9ps8e0ra 830132054794521ufury --vesting-amount 559767945205479ufury --vesting-end-time 1699574399				
fury add-genesis-account black1rd4xs8xvggyrejjsemrjs9vxs4h6hdgql5zd9d 600664657534247ufury --vesting-amount 405035342465753ufury --vesting-end-time 1699574399				
fury add-genesis-account black1ahrzs5snug646umdeeqrw6dap6ex0mntmzl5kp 450513424657534ufury --vesting-amount 303786575342466ufury --vesting-end-time 1699574399				
fury add-genesis-account black10qrkeqjjdyx7zsfdx9cszj89xjph2ctmlvkcjh 750815890410959ufury --vesting-amount 506284109589041ufury --vesting-end-time 1699574399				
fury add-genesis-account black1wa3lf2p624khztlrcz8kuh3sq8sfret26g0v4m 105117808219178ufury --vesting-amount 708821917808219ufury --vesting-end-time 1699574399				
fury add-genesis-account black1u7wn3x6zphmuh0yuld7jly72725d4re6vkvzsk 105117808219178ufury --vesting-amount 708821917808219ufury --vesting-end-time 1699574399				
fury add-genesis-account black1yrd99my556rvsfppfm96z6v7n439rr0x5feuwa 13515402739726ufury --vesting-amount 911359726027397ufury --vesting-end-time 1699574399				
fury add-genesis-account black14lxhx09fyemu9lw46c9m9jk63cg6u8wdmclcmu 138307561643836ufury --vesting-amount 932624383561644ufury --vesting-end-time 1699574399				
fury add-genesis-account black14c4ldwt8grnp6p9eq8kumw9uq63h8k462e628m 750815890410959ufury --vesting-amount 506284109589041ufury --vesting-end-time 1699574399				
fury add-genesis-account black1hqgete6pcc2v6zsp6kl4dr892wwgdken3ezk9k 450507452054795ufury --vesting-amount 303782547945205ufury --vesting-end-time 1699574399				
fury add-genesis-account black16wxtrzta2c9pnr3gxq7vax48kvhtw32ld4ymht 52558904109589ufury --vesting-amount 35441095890411ufury --vesting-end-time 1699574399				
fury add-genesis-account black1pzt8ykkt4puf0xef4h0xgf4watffgp40pze542 750815890410959ufury --vesting-amount 506284109589041ufury --vesting-end-time 1699574399				
fury add-genesis-account black1le6qxteptv3cc29cyt2clm6zmzmn4x57yv758a 901026849315068ufury --vesting-amount 607573150684932ufury --vesting-end-time 1699574399				
fury add-genesis-account black1d727nqk2j0k8pyd7qt9s4yh7x559r04a57lgwu 375437808219178ufury --vesting-amount 253162191780822ufury --vesting-end-time 1699574399				
fury add-genesis-account black130s6vp9xk0h2fffcec0km06qp2nkdqjlcwzc0l 750815890410959ufury --vesting-amount 506284109589041ufury --vesting-end-time 1699574399				
fury add-genesis-account black16uru2e0ja9j9fppg7at7s0pm0en5sr3r2t8s2p 300338301369863ufury --vesting-amount 202521698630137ufury --vesting-end-time 1699574399				
fury add-genesis-account black1fsezzt4rj6cm0my6z3f9hj3scvrkw5ns9fv6f6 450513424657534ufury --vesting-amount 303786575342466ufury --vesting-end-time 1699574399				
fury add-genesis-account black12dlda2x3fm6rqyplnk2sdemspcc9gwdjwgzdmj 750815890410959ufury --vesting-amount 506284109589041ufury --vesting-end-time 1699574399				
fury add-genesis-account black1w4v0tjfpfqrncl3mh8ezmceyjfjnnukzrd3tgt 760252602739726ufury --vesting-amount 512647397260274ufury --vesting-end-time 1699574399						
   
# Update total supply with claim values
#validators_supply=$(cat $HOME/fury/config/genesisjson | jq -r 'app_state["bank"]["supply"][0]["amount"]')
# Bc is required to add this big numbers
# total_supply=$(bc <<< "$amount_to_claim+$validators_supply")

echo $KEYRING
echo $KEY
# Sign genesis transaction
fury gentx $KEY 2000000000ufury --keyring-backend $KEYRING --chain-id $CHAINID
#fury gentx $KEY2 1000000000000000000000ufury --keyring-backend $KEYRING --chain-id $CHAINID

# Collect genesis tx
fury collect-gentxs

# Run this to ensure everything worked and that the genesis file is setup correctly
fury validate-genesis

if [[ $1 == "pending" ]]; then
  echo "pending mode is on, please wait for the first block committed"
fi

# Start the node (remove the --pruning=nothing flag if historical queries are not needed)
# fury start --pruning=nothing --trace --log_level trace --minimum-gas-prices=1000ufury --json-rpcapi eth,txpool,personal,net,debug,web3 --rpcladdr "tcp://0000:26657" --apienable true --apienabled-unsafe-cors true

