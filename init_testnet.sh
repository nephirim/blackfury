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
		
blackfuryd add-genesis-account fury1797slhn49lfmgn42vwjh6c6nrxq7k34n503g5t 11022438356ufury  				
blackfuryd add-genesis-account fury10h7ln638jkn55h5wfk2enyszhtv3nf3hxl4ccw 21802986301ufury  				
blackfuryd add-genesis-account fury1wexz2r5g6rsphka9qqvsqsaalc4shw7hm7wtlf 11022438356ufury  				
blackfuryd add-genesis-account fury13pqlfc4wesmfwg0mh224khsy9nrek2e3pwamx2 21774317808ufury  				
blackfuryd add-genesis-account fury1gwqvuzl4xwfwaxacygqkrux4dpgsl4duf785cc 6246745205ufury  				
blackfuryd add-genesis-account fury1kusnsv5evmtujdvr2hvr5chs9aen0gwyc8g0r2 19146372603ufury  				
blackfuryd add-genesis-account fury1dkmehpuc582evv2uq70kt0jptpehu3yrp5kkn8 20348060274ufury  				
blackfuryd add-genesis-account fury122nwk3z6e4yeh4aj4xad3jmjy38h8jw8m0kpla 4505134247ufury  				
blackfuryd add-genesis-account fury14lkxkdlrmvv732vhygeev95tmerxec6arkq8hy 11037369863ufury  				
blackfuryd add-genesis-account fury13fdh9uey7t0hxvg825gdfdx346z7wsq2awsajq 218160663014ufury  				
blackfuryd add-genesis-account fury1nrye3zfvs7l438n6l56avnnzm6f00me8utjfuz 21740273973ufury  				
blackfuryd add-genesis-account fury1q97lwrj563g8ccfm6kl9zxndf860v60e8kyuey 10902389041ufury  				
blackfuryd add-genesis-account fury1797slhn49lfmgn42vwjh6c6nrxq7k34n503g5t 6006646575ufury  				
blackfuryd add-genesis-account fury17mrjke5ra03hqnh7tlk265xlj2asz9lajt7h7z 19522049315ufury  				
blackfuryd add-genesis-account fury1q84cgldq5wf3am3tfuz2lzzx2azala64urfdca 15016915068ufury  				
blackfuryd add-genesis-account fury1unwqjxcwv95jfu3nt89ky8zqh39xpqvw8lnanw 10887457534ufury  				
blackfuryd add-genesis-account fury17parq8q75sr2cejrnrurtt7emfrc35a09xklfa 5393260274ufury  				
blackfuryd add-genesis-account fury199jfnv587vy4f63gn6t2t4dae42prk24lglnjg 30033830137ufury  				
blackfuryd add-genesis-account fury154sksmrrrveqcdavk4ugyxmwlmdepdg0hhthw8 6531638356ufury  				
blackfuryd add-genesis-account fury1q5cddxnk7yqxc4fjfmnpxhygkcl3uw6st5hrly 45050745205ufury  				
blackfuryd add-genesis-account fury1lw0ruyesylglsu6m7dhefw4vfh8l8qwegdtraa 3754378082ufury  				
blackfuryd add-genesis-account fury1zm3z7dd4ee8vfxu82lfmma4wmcnt3z87y4tgra 3754378082ufury  				
blackfuryd add-genesis-account fury1wackempnenwpzkywav6hnmdckqmthv30gw98am 3754378082ufury  				
blackfuryd add-genesis-account fury1cnzy6g0vet3ykdhk2xgvkvc350d3gke4aw89pv 109016126027ufury  				
blackfuryd add-genesis-account fury1r9764rmspkpy0qxx5myxq0kz90dukjnap0pgwe 7508158904ufury  				
blackfuryd add-genesis-account fury1nk2rycxdgl5gxtd0hpncprwfp0lzeafwgeuya2 6577627397ufury  				
blackfuryd add-genesis-account fury1nhhvjlq376f4gz6jvptsgv665vr3ss4qwj43sy 11653145205ufury  				
blackfuryd add-genesis-account fury16kgjjvhq9s07l639ylpc6sfp4cp6ze8huqrp4d 6006646575ufury  				
blackfuryd add-genesis-account fury1aqqskedu4zgmjqhpztjqzd7g8sfyzya2mrgmll 11352723288ufury  				
blackfuryd add-genesis-account fury1fdgys6er5ak4syqgvc8uswcedjwknh6q6x6de6 21372361644ufury  				
blackfuryd add-genesis-account fury1e5pkymea4jlcmnzvrycc97jfhdzcvpd34sfeyy 10835495890ufury  				
blackfuryd add-genesis-account fury1aqqskedu4zgmjqhpztjqzd7g8sfyzya2mrgmll 11172350685ufury  				
blackfuryd add-genesis-account fury18rp5vnjsswdazjvrdy2lj4cass9z29h56yczv9 6683939726ufury  				
blackfuryd add-genesis-account fury1ty8uvzrhy5taa4auc9h9c02x0zfugu0ja6jqak 60067063014ufury  				
blackfuryd add-genesis-account fury1dn8yt2pe62a9nz964vmj2pwreljxehxcukkymy 45050745205ufury  				
blackfuryd add-genesis-account fury16qt98ac36dtaaxr7axu67z68ue8pjpdcx7h5pl 3769309589ufury  				
blackfuryd add-genesis-account fury1hwapfpynu0evhdvhnge6929eu0hrpj5pmt6de6 11239243836ufury  				
blackfuryd add-genesis-account fury1q84cgldq5wf3am3tfuz2lzzx2azala64urfdca 15016915068ufury  				
blackfuryd add-genesis-account fury145wnzde7ak68zm49yhgyc0apxpj6gwjejxpnpz 12095117808ufury  				
blackfuryd add-genesis-account fury12u9t55uxfmkd8c4mzpeatvnjmyvuj5gexmucrt 113064953425ufury  				
blackfuryd add-genesis-account fury1xsmep764kqh3fq4rq7yp7t3qgnjycp9lupcl2t 7508158904ufury  				
blackfuryd add-genesis-account fury16k7xarsvqf7vv0qhu520rmarpt40g6jthg7jrv 75083978082ufury  				
blackfuryd add-genesis-account fury1zejc6j533jjgzj64munsps257sa952820h270x 13665315068ufury  				
blackfuryd add-genesis-account fury1e5pkymea4jlcmnzvrycc97jfhdzcvpd34sfeyy 4940536986ufury  				
blackfuryd add-genesis-account fury1wypy5jw7xz0lkrz3ky538vr4e7seuvs94q4qf9 3754378082ufury  				
blackfuryd add-genesis-account fury1nk2rycxdgl5gxtd0hpncprwfp0lzeafwgeuya2 7508158904ufury  				
blackfuryd add-genesis-account fury19frtd7huz6zrefnz3zl64z6q8r9wkt3pgdne7l 10912542466ufury  				
blackfuryd add-genesis-account fury1lqseqddsce3yu5wa7atf8feqqfyn3lcma03h9p 142502120548ufury  				
blackfuryd add-genesis-account fury1kusnsv5evmtujdvr2hvr5chs9aen0gwyc8g0r2 10887457534ufury  				
blackfuryd add-genesis-account fury1elhw3cct0jgxvf2tw5yrrkc6u02shg8zpr58vq 4505134247ufury  				
blackfuryd add-genesis-account fury19rn5vwga60kun3j38taxd26cm7lelgdapah08v 10978838356ufury  				
blackfuryd add-genesis-account fury1htxf0fcfmyxyw8stjw38jz2s3muh3q6y905m29 10932252055ufury  				
blackfuryd add-genesis-account fury1ymtq3eyk2s6q44phkqv8k35jqve52d0z7dxt52 4129457534ufury  				
blackfuryd add-genesis-account fury169qmwy36jkhfzjdft3ptqqmj2zgkc3tvja47cd 45050745205ufury  				
blackfuryd add-genesis-account fury1w6pktm54f5zgq032xxacc3ylme98t560wglncp 3754378082ufury  				
blackfuryd add-genesis-account fury1zjvwyksf9vnk0dwxx3n8m9xlw6pglnf0g9cga2 3754378082ufury  				
blackfuryd add-genesis-account fury1zurjhfcc5365dsy58unk6rnh9nltfsqqx8xjz3 15016915068ufury  				
blackfuryd add-genesis-account fury134fwqahtfrg0zfr8x2su46fmrwme5mzw647qxg 9325621918ufury  				
blackfuryd add-genesis-account fury1mgmcztfm8vvmfdmtlzk3n523vqm275j7j9h5n2 7631194521ufury  				
blackfuryd add-genesis-account fury16k7xarsvqf7vv0qhu520rmarpt40g6jthg7jrv 150168553425ufury  				
blackfuryd add-genesis-account fury1nhhvjlq376f4gz6jvptsgv665vr3ss4qwj43sy 10871928767ufury  				
blackfuryd add-genesis-account fury1r0afwj9krzmwsadjm6l6y7mlnq6l7px0w7xrr5 3883386301ufury  				
blackfuryd add-genesis-account fury1acd5nzld4f3c268cax90lk6he7m2w5ml64qkaw 7508158904ufury  				
blackfuryd add-genesis-account fury1lmw6wtyk0w6zg6jh05z4t5l7amvsalap5alx6k 10316476712ufury  				
blackfuryd add-genesis-account fury1wxvs6du63g8nmm5jpd3lzgwl6mqv0je9g6478l 11262536986ufury  				
blackfuryd add-genesis-account fury17zjpts3cd35tesmwrunkynygyw7fuamsg8ncgk 7133079452ufury  				
blackfuryd add-genesis-account fury1ygqgkduw25g5uezflw4gnsm4n2yvawkm33y2ry 3754378082ufury  				
blackfuryd add-genesis-account fury1zjydgdhd8uk4u29tq2e68j7kmqxrk3vsd4qnjm 10901791781ufury  				
blackfuryd add-genesis-account fury1x60g2u04z7jzdnjf3znfdcxa9ut5kufql3n6hr 301947917808ufury  				
blackfuryd add-genesis-account fury1lw0ruyesylglsu6m7dhefw4vfh8l8qwegdtraa 3754378082ufury  				
blackfuryd add-genesis-account fury15tmdfth2kmmaedag9sk7j0nw4herj39ayu0v3r 124339435616ufury  				
blackfuryd add-genesis-account fury1r4w3ae4vuyatckn8pahvexl4kpvmndref9lfwv 6006646575ufury  				
blackfuryd add-genesis-account fury1e5pkymea4jlcmnzvrycc97jfhdzcvpd34sfeyy 7508158904ufury  				
blackfuryd add-genesis-account fury19j5upjz972gh24890tn6mpf4gzqdk09a8vjw6m 7508158904ufury  				
blackfuryd add-genesis-account fury1cg3e7sfxkunmwgfsrqj3caju9aheuzlzmh76nx 3754378082ufury  				
blackfuryd add-genesis-account fury1ca6vj94jtn5v57prr826ncskrm0reatecv6rz7 62281106849ufury  				
blackfuryd add-genesis-account fury1ltk76ycjtz05j7ww7yznrr5cn5kz58zas0my7l 15016915068ufury  				
blackfuryd add-genesis-account fury1q5cddxnk7yqxc4fjfmnpxhygkcl3uw6st5hrly 10870136986ufury  				
blackfuryd add-genesis-account fury1r0afwj9krzmwsadjm6l6y7mlnq6l7px0w7xrr5 4549928767ufury  				
blackfuryd add-genesis-account fury1y26ufq905uy0s27ftujamqm5y8gdys8dv3r3xm 15016915068ufury  				
blackfuryd add-genesis-account fury1w6pktm54f5zgq032xxacc3ylme98t560wglncp 3754378082ufury  				
blackfuryd add-genesis-account fury1797slhn49lfmgn42vwjh6c6nrxq7k34n503g5t 5495989041ufury  				
blackfuryd add-genesis-account fury122phsq2td9x3cv9pwszse3f69smfhhncndny3m 5255890411ufury  				
blackfuryd add-genesis-account fury1vv6rsgxqh4hyxtt6dt4rmv4a93n7amjt4j0n95 11370641096ufury  				
blackfuryd add-genesis-account fury14cyvvq5nptglnjy2hg9ky6r26349v73nfwp4qe 31535342466ufury  				
blackfuryd add-genesis-account fury17mrjke5ra03hqnh7tlk265xlj2asz9lajt7h7z 10511780822ufury  				
blackfuryd add-genesis-account fury1clseqnswluj79tzpng60sqhy3nf7pz0hvnuhe8 4505134247ufury  				
blackfuryd add-genesis-account fury1vvgh02zkh4qf9hydk0walw9nyx4udemrnyvmvw 13755501370ufury  				
blackfuryd add-genesis-account fury1ecm2vqdexfqy6kfpwdxxpl37vy289pmh8ya9hv 3754378082ufury  				
blackfuryd add-genesis-account fury1mgmcztfm8vvmfdmtlzk3n523vqm275j7j9h5n2 4700438356ufury  				
blackfuryd add-genesis-account fury1je5w89kn456ctj7fd3y4w4rf3f7klj6xr5s0c5 19146372603ufury  				
blackfuryd add-genesis-account fury1nrye3zfvs7l438n6l56avnnzm6f00me8utjfuz 29734602740ufury  				
blackfuryd add-genesis-account fury1yuqgnfuavv2wf6lpsr0w6wqed9d7grza2675hy 10901791781ufury  				
blackfuryd add-genesis-account fury129kdy7qdk5r4qgrenqdd6ftjjuvcc3hqxtuxey 60067063014ufury  				
blackfuryd add-genesis-account fury10d4udrt2md9dzeqfaytkdhcd9utsmvxk05y4cf 5255890411ufury  				
blackfuryd add-genesis-account fury108gy2rzhx27jj96argmgpesvlj9ur6k8tejz84 10888652055ufury  				
blackfuryd add-genesis-account fury1ty8uvzrhy5taa4auc9h9c02x0zfugu0ja6jqak 79589112329ufury  				
blackfuryd add-genesis-account fury1dn8yt2pe62a9nz964vmj2pwreljxehxcukkymy 75083978082ufury  				
blackfuryd add-genesis-account fury1le8x5sn43nxn0sz5vuze509sea70sc6jyqj5ah 5255890411ufury  				
blackfuryd add-genesis-account fury1xvf0jjf9vkqz40rdlmm67cfhlzcwu520knk7yu 15016915068ufury  				
blackfuryd add-genesis-account fury1tu4g3fpx9282y2ejt6zv6m9geq97mym57ln33w 4354624658ufury  				
blackfuryd add-genesis-account fury168q4t94pxq97fy8vqenc6fx3znc7p8fe9y8kxq 3754378082ufury  				
blackfuryd add-genesis-account fury1ty8uvzrhy5taa4auc9h9c02x0zfugu0ja6jqak 10932252055ufury  				
blackfuryd add-genesis-account fury1fzd65shhhkl7d3g2f5377fufd4k9adn2ph7zae 18019939726ufury  				
blackfuryd add-genesis-account fury1dn8yt2pe62a9nz964vmj2pwreljxehxcukkymy 30033830137ufury  				
blackfuryd add-genesis-account fury1yuqgnfuavv2wf6lpsr0w6wqed9d7grza2675hy 21023561644ufury  				
blackfuryd add-genesis-account fury1yafjl2890r3gn38dc7ksp5r6vnfmy8udlf4ut6 125114082192ufury  				
blackfuryd add-genesis-account fury1je5w89kn456ctj7fd3y4w4rf3f7klj6xr5s0c5 10901194521ufury  				
blackfuryd add-genesis-account fury1xsmep764kqh3fq4rq7yp7t3qgnjycp9lupcl2t 11472175342ufury  				
blackfuryd add-genesis-account fury1acd5nzld4f3c268cax90lk6he7m2w5ml64qkaw 7508158904ufury  				
blackfuryd add-genesis-account fury154sksmrrrveqcdavk4ugyxmwlmdepdg0hhthw8 23516526027ufury  				
blackfuryd add-genesis-account fury1l52awqe7p8r9mmpm27c5avywt9urqdpd9x7qlm 5255890411ufury  				
blackfuryd add-genesis-account fury1fqtp07xjqwx2my5n42vcwufu6hc70zw4m7wlx0 3754378082ufury  				
blackfuryd add-genesis-account fury18ws6vgl6w84qcs0wncup25va9ze88852drenza 21023561644ufury  				
blackfuryd add-genesis-account fury1wexz2r5g6rsphka9qqvsqsaalc4shw7hm7wtlf 30033830137ufury  				
blackfuryd add-genesis-account fury1vu2p0zta4lg4fsdv777ugmajyvqrcsljm56nuq 6006646575ufury  				
blackfuryd add-genesis-account fury1wltvdtjdnpe6uh5adg0m7ydy8cle8wwykfcqdd 6695287671ufury  				
blackfuryd add-genesis-account fury1lmw6wtyk0w6zg6jh05z4t5l7amvsalap5alx6k 19719742466ufury  				
blackfuryd add-genesis-account fury12m90u3cetug08frawfu0p6jd96s354xd78z4mg 15016915068ufury  				
blackfuryd add-genesis-account fury1pm350tzyg0rvvma7e43ezz729yxa5ljukn92z7 127642882192ufury  				
blackfuryd add-genesis-account fury1pm3pva53gv4nnhvmduuh322pjmxv98t62zu8jx 4114526027ufury  				
blackfuryd add-genesis-account fury14lkxkdlrmvv732vhygeev95tmerxec6arkq8hy 34013375342ufury  				
blackfuryd add-genesis-account fury1y2l7gnylqw3yp6u52tfgxuk0klx5uymsplxknl 60067063014ufury  				
blackfuryd add-genesis-account fury1gyv42pg4j790wlqt5muge7pe9d9xdw7rmlx3rt 3754378082ufury  				
blackfuryd add-genesis-account fury1e5pkymea4jlcmnzvrycc97jfhdzcvpd34sfeyy 21774317808ufury  				
blackfuryd add-genesis-account fury1klfd2u30qakx8qeqcw0xdcc3p3djq7htt6ny3c 14675879452ufury  				
blackfuryd add-genesis-account fury15tmdfth2kmmaedag9sk7j0nw4herj39ayu0v3r 10812202740ufury  				
blackfuryd add-genesis-account fury145tk8ry9gzmr5jyn96pznfanadxqrvmp069rcz 21793430137ufury  				
blackfuryd add-genesis-account fury17tc5dxkejps3adusaluzu7xn9jmg7qmwffky7t 15016915068ufury  				
blackfuryd add-genesis-account fury170k6xd7atru2uzmnqy345gyr5xcw8ke7plx6h0 3754378082ufury  				
blackfuryd add-genesis-account fury1xe7fkxfkl882uua6zyjadv296umtxdyktwunaw 6006646575ufury  				
blackfuryd add-genesis-account fury1kxyzha73fnrzd8sf3a44dnl89whrvkdyftn23c 4505134247ufury  				
blackfuryd add-genesis-account fury14z20ghpgxayvll6ppz9m4pxp939tx2uz0p8wcj 15016915068ufury  				
blackfuryd add-genesis-account fury1pm350tzyg0rvvma7e43ezz729yxa5ljukn92z7 11068427397ufury  				
blackfuryd add-genesis-account fury1gwqvuzl4xwfwaxacygqkrux4dpgsl4duf785cc 10871928767ufury  				
blackfuryd add-genesis-account fury1cuazcgw2m3x5r9gkyusrugn50wee4t9p9h544m 8301320548ufury  				
blackfuryd add-genesis-account fury1rd4xs8xvggyrejjsemrjs9vxs4h6hdgq2y0hnt 6006646575ufury  				
blackfuryd add-genesis-account fury1klfd2u30qakx8qeqcw0xdcc3p3djq7htt6ny3c 15016915068ufury  				
blackfuryd add-genesis-account fury1xsmep764kqh3fq4rq7yp7t3qgnjycp9lupcl2t 15016915068ufury  				
blackfuryd add-genesis-account fury1tu4g3fpx9282y2ejt6zv6m9geq97mym57ln33w 3754378082ufury  				
blackfuryd add-genesis-account fury1ahrzs5snug646umdeeqrw6dap6ex0mntwjjwq8 4505134247ufury  				
blackfuryd add-genesis-account fury1ymtq3eyk2s6q44phkqv8k35jqve52d0z7dxt52 10901791781ufury  				
blackfuryd add-genesis-account fury10qrkeqjjdyx7zsfdx9cszj89xjph2ctm2umzy3 7508158904ufury  				
blackfuryd add-genesis-account fury1vvgh02zkh4qf9hydk0walw9nyx4udemrnyvmvw 4985331507ufury  				
blackfuryd add-genesis-account fury1wa3lf2p624khztlrcz8kuh3sq8sfret20czkra 10511780822ufury  				
blackfuryd add-genesis-account fury1hwapfpynu0evhdvhnge6929eu0hrpj5pmt6de6 52558904110ufury  				
blackfuryd add-genesis-account fury1u7wn3x6zphmuh0yuld7jly72725d4re6expcxs 105117808219ufury  				
blackfuryd add-genesis-account fury1yrd99my556rvsfppfm96z6v7n439rr0xpe5xcm 13515402740ufury  				
blackfuryd add-genesis-account fury14lxhx09fyemu9lw46c9m9jk63cg6u8wdwgjzd6 13830756164ufury  				
blackfuryd add-genesis-account fury14c4ldwt8grnp6p9eq8kumw9uq63h8k46lfhs3a 7508158904ufury  				
blackfuryd add-genesis-account fury1hqgete6pcc2v6zsp6kl4dr892wwgdkenyf0vns 45050745205ufury  				
blackfuryd add-genesis-account fury1pm3pva53gv4nnhvmduuh322pjmxv98t62zu8jx 10912542466ufury  				
blackfuryd add-genesis-account fury1zm3z7dd4ee8vfxu82lfmma4wmcnt3z87y4tgra 4549928767ufury  				
blackfuryd add-genesis-account fury1fh738d3juq6zysrgu5cg52kjqt4d2z3gagg8pr 11430367123ufury  				
blackfuryd add-genesis-account fury143yykhk2r0hpj572qw4f7669hnx64r8n30j7nl 3754378082ufury  				
blackfuryd add-genesis-account fury16wxtrzta2c9pnr3gxq7vax48kvhtw32lc9fppd 5255890411ufury  				
blackfuryd add-genesis-account fury1pzt8ykkt4puf0xef4h0xgf4watffgp405j5wrv 7508158904ufury  				
blackfuryd add-genesis-account fury1wltvdtjdnpe6uh5adg0m7ydy8cle8wwykfcqdd 8334169863ufury  				
blackfuryd add-genesis-account fury1le6qxteptv3cc29cyt2clm6zmzmn4x573unw3m 9010268493ufury  				
blackfuryd add-genesis-account fury1d727nqk2j0k8pyd7qt9s4yh7x559r04apwjjc6 3754378082ufury  				
blackfuryd add-genesis-account fury130s6vp9xk0h2fffcec0km06qp2nkdqjld70zee 7508158904ufury  				
blackfuryd add-genesis-account fury16uru2e0ja9j9fppg7at7s0pm0en5sr3rlm22u8 30033830137ufury  				
blackfuryd add-genesis-account fury1fh738d3juq6zysrgu5cg52kjqt4d2z3gagg8pr 3754378082ufury  				
blackfuryd add-genesis-account fury1fsezzt4rj6cm0my6z3f9hj3scvrkw5nssepqlu 4505134247ufury  				
blackfuryd add-genesis-account fury12dlda2x3fm6rqyplnk2sdemspcc9gwdjmc0hd5 7508158904ufury  				
blackfuryd add-genesis-account fury1w4v0tjfpfqrncl3mh8ezmceyjfjnnukzkau37d 11022438356ufury  				
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
