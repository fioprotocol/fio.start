# Welcome to the FIO Testnet [manual node installation]  

Chain ID: 88694aece2bb4ab345e76337fda58f9cf7a8f72f924d4e94f31e3f450a61467e  
Based on tag: v1.2.1-2442


Network Monitor: https://monitor.testnet.fioprotocol.io  

! This repo is for manual installation.  

  
## Scope:  
1. Installing FIO  
1.1 [From precompiled binaries](#11-fio---installing-from-precompiled-binaries)  
1.2 [Compile from sources](#12-fio---installing-from-sources)  
2. [Update FIO](#2-update-fio-software-to-new-version)  
3. [FIO testnet node manual configuration](#3-fio-testnet-node-manual-configuration)  
4. [BP Registration](https://github.com/ansigroup/fio.start#4-registering-bp)
5. [Restore from Backups/Snapshots](#51-restorestart-from-backup)  
6. [Useful Information](#6-usefull-information )
---------------------------  

# 1. Installing FIO  
___  
## 1.1 FIO - installing from precompiled binaries  

A. Download the latest FIO version for Ubuntu-18.04 from [precompiled releases](./releases/)
For Example: fio_1.2.1-2442-ubuntu-18.04_amd64.deb              

After download, you can install it using apt:  
```
apt install ./fio_1.2.1-2442-ubuntu-18.04_amd64.deb   
```
It will download all dependencies and install FIO to `/usr/local/fio/v1.2.1-2442` folder

B. Copy binaries to keep old versions and make sym link to latest:  

```
 mkdir /opt/bin
 mkdir /opt/bin/v1.2.1-2442
 cp /usr/local/fio/v1.2.1-2442/bin/nodeos /opt/bin/v1.2.1-2442/
 cp /usr/local/fio/v1.2.1-2442/bin/cleos /opt/bin/v1.2.1-2442/
 cp /usr/local/fio/v1.2.1-2442/bin/keosd /opt/bin/v1.2.1-2442/
 ln -sf /opt/bin/v1.2.1-2442 /opt/bin/bin
```

So /opt/bin/bin will point to latest binaries  

## 1.2 FIO - Installing from sources  

A. Create folder, download sources, compile and install:  
```
mkdir /opt/FIO  
cd /opt/FIO 

git clone https://github.com/fioprotocol/fio --recursive    
cd fio  

git checkout   
git submodule update --init --recursive   

./scripts/fioio_build.sh -y

```

B. Copy binaries to keep old versions and make sym link to latest:
```
mkdir /opt/bin
mkdir /opt/bin/v1.2.1-2442
cp /opt/FIO/fio/build/programs/nodeos/nodeos /opt/bin/v1.2.1-2442/
cp /opt/FIO/fio/build/programs/cleos/cleos /opt/bin/v1.2.1-2442/
cp /opt/FIO/fio/build/programs/keosd/keosd /opt/bin/v1.2.1-2442/
ln -sf /opt/bin/v1.2.1-2442 /opt/bin/bin
```
So /opt/bin/bin will point to latest binaries

---------------------------------------------------------  


# 2. Update FIO software to new version  

## 2.1 Update binaries  

To update precompiled installation please folow the same steps as in 1.1 (Installation from precompiled)  

# 2.2 Update sources  

```
cd /opt/FIO/fio
git checkout -f
git branch -f
git pull
git checkout v   
git submodule update --init --recursive   

./scripts/fioio_uninstall.sh  
./scripts/fioio_build.sh -y

mkdir /opt/bin/
cp /opt/FIO/fio/build/programs/nodeos/nodeos /opt/bin/v1.2.1-2442/
cp /opt/FIO/fio/build/programs/cleos/cleos /opt/bin/v1.2.1-2442/
cp /opt/FIO/fio/build/programs/keosd/keosd /opt/bin/v1.2.1-2442/
ln -sf /opt/bin/v1.2.1-2442 /opt/bin/bin
```  
 
------------------------------------------------------------------  

# 3. FIO Testnet node manual configuration
    
```
    mkdir /opt/FioTestnet
    cd /opt/FioTestnet
    git clone https://github.com/fioprotocol/fio.tools ./

```

- In case you use a different data-dir folders -> edit all paths in files fioNode/cleos.sh, fioNode/start.sh, fioNode/stop.sh, fioNode/config.ini, fioWallet/start_wallet.sh, fioWallet/stop_wallet.sh  

- Edit fioNode/config.ini:  
  - server address (replace with your external domain/ip):  
        `p2p-server-address = ENRT_YOUR_NODE_EXTERNAL_IP_ADDRESS:9876`  
  - if BP: your producer name: producer-name = YOUR_BP_NAME  
  - if BP: add producer keypair for signing blocks (this pub key should be used in regproducer action):  
  `signature-provider = YOUR_PUB_KEY_HERE=KEY:YOUR_PRIV_KEY_HERE`  
  - replace p2p-peer-address list with fresh generated on [monitor site](https://monitor.testnet.fioprotocol.io/#p2p)  
  - Check chain-state-db-size-mb value in config, it should be not bigger than you have RAM:  
    chain-state-db-size-mb = 16384  
  
- Open TCP Ports (8888, 9876) on your firewall/router  

- Start wallet, run:
```
cd /opt/FioTestnet
./fioWallet/start_wallet.sh  
```

**First run should be with --delete-all-blocks and --genesis-json**  
```
./start.sh --delete-all-blocks --genesis-json genesis.json
```  
Check logs stderr.txt if node is running ok. 


- Create your wallet file  
```
./cleos.sh wallet create --to-file pass.txt
```
Your password will be in pass.txt it will be used when unlock wallet  


- Unlock your wallet  
```
./cleos.sh wallet unlock  
```
enter the wallet password.  


- Import your key  
```
./cleos.sh wallet import
```
Enter your private key  



- Check if you can access you node using link http://you_server:8888/v1/chain/get_info (<a href="https://testnet.fioprotocol.io/v1/chain/get_info" target="_blank">Example</a>)  

# 4. Registering BP

- create own FIO key pair  
  you can create key pair using cleos command  
  `./cleos.sh create key`  
   or using [monitor](http://monitor.testnet.fioprotocol.io/#createKey) 
  Store you keypair information includein generated actor name.
- go to [Faucet](http://monitor.testnet.fioprotocol.io/#faucet) and get free FIO tokens using your generated FIO public key.  
- using your FIO public key [register your first FIO address](http://monitor.testnet.fioprotocol.io/#account)
- create new FIO keypair for blocksigning.
- use your created FIO address in prepared script /scripts/regproducer.sh for BP registration
- register your node endpoint information in the [FIO monitor](http://monitor.testnet.fioprotocol.io/#register)


==============================================================================  
# 5 Backups

# 5.1 Restore/Start from Backup
   Download latest block and state archive for your OS from 
   
   ```
   wget  
   wget 
   ```
   After downloaded extract their
   ```
   tar xzvf blocks-latest.tar.gz -C .
   tar xzvf state-latest.tar.gz -C .
   ```
   You got two folders block and state.  
   Ater that go to **NODE** folder, and remove files from folder blocks and state
   ```
   cd /opt/FioTestnet
   rm blocks/*
   rm state/*
   ```
   After that go where you extracted archive and move file from folder 
   ```
   mv ~/blocks/* /opt/FioTestnet/blocks/
   mv ~/state/* /opt/FioTestnet/state/
   ```
   After files moved start your NODE
   ```
   ./start.sh
   ```
# 5.2 Restore/Start from Snapshots
   Download latest snapshot to snapshots folder in your **NODE** directory
   ```
   cd /opt/FioTestnet/snapshots/
   wget latest-snapshot.bin
   ```
   after it downloads run `start.sh` script with option `--snapshot` and snapshot file path
   ```
   cd /opt/FioTestnet
   ./start.sh --snapshot /opt/FioTestnet/snapshots/latest-snapshot.bin
   ```
 ---


# 6. Useful Information  
  - create own FIO key pair  
  you can create key pair using cleos command  
  `./cleos.sh create key`  
   or using [monitor](http://monitor.testnet.fioprotocol.io/#createKey) 

   **Store your keypair information including generated actor name.**

- [Faucet](http://monitor.testnet.fioprotocol.io/#faucet)
- [register FIO address](http://monitor.testnet.fioprotocol.io/#account)
- [Monitor BP Registration](http://monitor.testnet.fioprotocol.io/#register)
- [API requests](http://monitor.testnet.fioprotocol.io/#api)
- [P2P endpoints](http://monitor.testnet.fioprotocol.io/#p2p)
- [API endpoints](http://monitor.testnet.fioprotocol.io/#apiendpoints)

# Other Tools/Examples  
- In [scripts folder](./scripts/) you can find script examples: how to register bp, stake, vote, claimrewards, etc  
- Vote using monitor.  Monitor can prepare Cleos command, or send the command through Scatter.
