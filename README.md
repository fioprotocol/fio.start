# Welcome to the FIO Testnet [manual node installation]

Chain ID: **b20901380af44ef59c5918439a1f9a41d83669020319a80574b804a5f95cbd7e**

Based on tag: **v0.9.2**

Network Monitor: https://monitor.testnet.fioprotocol.io

!! This repo is for manual installation. !!

## Scope:
1. [Installing FIO](#1-installing-fio)
    1. [From precompiled binaries](#11-fio---installing-from-precompiled-binaries)
    1. [Compile from sources](#12-fio---installing-from-sources)
2. [Update FIO](#2-update-fio-software-to-new-version)
3. [FIO testnet node manual configuration](#3-fio-testnet-node-manual-configuration)
4. [BP Registration](https://github.com/ansigroup/fio.start#4-registering-bp)
5. [Restore from Backups/Snapshots](#51-restorestart-from-backup)
6. [Useful Information](#6-usefull-information )
---------------------------

# 1. Installing FIO
___
## 1.1 FIO - installing from precompiled binaries

### 1.1.1 Download the latest FIO version for Ubuntu-18.04

For Example: [fioprotocol_0.9.2-ubuntu-18.04_amd64.deb](./releases)

After download, you can install it using apt:

```
apt install ./fioprotocol_0.9.2-ubuntu-18.04_amd64.deb
```

It will download all dependencies and install FIO to `/usr/local/fioprotocol/v0.9.2` folder.

### 1.1.2 Copy binaries to keep old versions and make symlink to latest

```
 mkdir /opt/bin
 mkdir /opt/bin/v0.9.2
 cp /usr/local/fioprotocol/v0.9.2/bin/nodeos /opt/bin/v0.9.2/
 cp /usr/local/fioprotocol/v0.9.2/bin/clio /opt/bin/v0.9.2/
 cp /usr/local/fioprotocol/v0.9.2/bin/keosd /opt/bin/v0.9.2/
 ln -sf /opt/bin/v0.9.2 /opt/bin/bin
```

So `/opt/bin/bin` will always point to latest binaries.

## 1.2 FIO - Installing from sources

### Create a folder, download sources, compile and install

```
mkdir /opt/FIO
cd /opt/FIO

git clone https://github.com/fioprotocol/fio --recursive
cd fio

git submodule update --init --recursive

./scripts/fio_build.sh -y
```

### Copy binaries to keep old versions and make symlink to latest

```
mkdir /opt/bin
mkdir /opt/bin/v0.9.2
cp /opt/FIO/fio/build/programs/nodeos/nodeos /opt/bin/v0.9.2/
cp /opt/FIO/fio/build/programs/clio/clio /opt/bin/v0.9.2/
cp /opt/FIO/fio/build/programs/keosd/keosd /opt/bin/v0.9.2/
ln -sf /opt/bin/v0.9.2 /opt/bin/bin
```

So `/opt/bin/bin` will always point to latest binaries.

# 2. Update FIO software to new version

## 2.1 Update binaries

To update precompiled installation, please follow the same steps as in 1.1 (Installation from precompiled).

## 2.2 Update sources

```
cd /opt/FIO/fio
git checkout -f
git branch -f
git pull
git checkout v0.9.2
git submodule update --init --recursive

./scripts/fio_uninstall.sh
./scripts/fio_build.sh -y

mkdir /opt/bin/
cp /opt/FIO/fio/build/programs/nodeos/nodeos /opt/bin/v0.9.2/
cp /opt/FIO/fio/build/programs/clio/clio /opt/bin/v0.9.2/
cp /opt/FIO/fio/build/programs/keosd/keosd /opt/bin/v0.9.2/
ln -sf /opt/bin/v0.9.2 /opt/bin/bin
```

# 3. FIO Testnet node manual configuration

Clone this repository in `/opt/FioTestnet` first:

```
mkdir /opt/FioTestnet
cd /opt/FioTestnet
git clone https://github.com/fioprotocol/fio.start ./
```

Some important notes:

- In case you use a different data-dir folders, edit all paths in files
    - fioNode/clio.sh
    - fioNode/start.sh
    - fioNode/stop.sh
    - fioNode/config.ini
    - fioWallet/start_wallet.sh
    - fioWallet/stop_wallet.sh

Now modify the config as such.

- Edit **fioNode/config.ini**:
  - server address (replace with your external domain/ip).

        p2p-server-address = ENRT_YOUR_NODE_EXTERNAL_IP_ADDRESS:9876

  - replace p2p-peer-address list with fresh generated on [the monitor site](https://monitor.testnet.fioprotocol.io/#p2p).

## Generate the addresses & keys for your BP

This config.ini also includes the keys for the BP owner and the BP block signing. You'll need to create these 2 addresses & keys first.

First, start the wallet. This is a daemon running on the system.

```
cd /opt/FioTestnet
./fioWallet/start_wallet.sh
```

Next, create your wallet file. This file will hold your private keys, the password will be the encryption key to your wallet.

```
./clio.sh wallet create --to-file pass.txt
```

Your password will now be in the `pass.txt` file and will be used when unlocking your wallet. Keep this secure.

Next, unlock your wallet.

```
./clio.sh wallet unlock
```

You'll be prompted for the wallet password, the one in `pass.txt`.

Now, create 2 new keys.

```
./clio.sh create key -f bp-owner.txt
./clio.sh create key -f bp-block-signing.txt
```

Import the `bp-owner.txt` one to your wallet, the block signing key should never be imported!

```
./clio.sh wallet import --private-key 5K....
```

You now have all the private keys needed to continue.

Edit **fioNode/config.ini** again, and modify these settings:

  - if you are a BP:

        producer-name = YOUR_BP_NAME

    Replace `YOUR_BP_NAME` with the Actor Name from the `bp-owner.txt` key you just created.

  - if you are a BP: add producer keypair for signing blocks. This same pub key should be used in regproducer action:

        signature-provider = YOUR_PUB_KEY_HERE=KEY:YOUR_PRIV_KEY_HERE

    This is the public & private key from the `bp-block-signing.txt` file. For instance:

        signature-provider = FIO7cA3GSRH5GfUp63o5dfXX7EUvgfqC4jFjL5McD5r3KqkDABAau=KEY:5JiVVpSDv4UYEPnjkKDN42mAY2n9m4ZUKoeq7nqKfuk5NpGygr5

    Where `FIO7cA3GSRH5GfUp63o5dfXX7EUvgfqC4jFjL5McD5r3KqkDABAau` is your public key and `5JiVVpSDv4UYEPnjkKDN42mAY2n9m4ZUKoeq7nqKfuk5NpGygr5` is your private key.

  - Check chain-state-db-size-mb value in config, it should not be bigger than your available RAM:

        chain-state-db-size-mb = 16384

  - Open TCP Ports (8888, 9876) on your firewall/router.

## Start the FIO node

The first run should be with `--delete-all-block` and `--genesis-json`.@

```
cd /opt/FioTestnet/fioNode
./start.sh --delete-all-blocks --genesis-json genesis.json
```

Check the logs `/opt/FioTestnet/fioNode/std*` if node is running ok.

Now check if you can access your node using link `http://you_server:8888/v1/chain/get_info` (<a href="https://testnet.fioprotocol.io/v1/chain/get_info" target="_blank">Example</a>).

# 4. Registering BP (Block Producer)

- Go to [Faucet](http://monitor.testnet.fioprotocol.io/#faucet) and get free FIO tokens using your generated FIO public key, the one from `bp-owner.txt`.
- Using your FIO public key, [register your first FIO address](http://monitor.testnet.fioprotocol.io/#account).
- Modify the `scripts/regproducer.sh` for BP registration.

      # This address is the one you registered earlier, ie you@fiotestnet
      fioAddress="you@fiotestnet"

      # The actor is the actor/public hash from the bp-owner.txt file
      actor=fa5qjhl3gcdp

      # The signkey is the public key from bp-block-signing.txt
      signkey="FIO7..."

  Once modified, execute the script as `./regProducer.sh`.

- Register your node endpoint information in the [FIO monitor](http://monitor.testnet.fioprotocol.io/#register).

# 5 Backups

# 5.1 Restore/Start from Backup

Download latest block and state archive for your OS from

```
wget
wget
```

After downloading, extract their contents:

```
tar xzvf blocks-latest.tar.gz -C .
tar xzvf state-latest.tar.gz -C .
```

You will have two folders block and state.
Next, go to **NODE** folder, and remove files from folder blocks and state:

```
cd /opt/FioTestnet
rm blocks/*
rm state/*
```

Next, go where you extracted the archive and move files from folder:

```
mv ~/blocks/* /opt/FioTestnet/blocks/
mv ~/state/* /opt/FioTestnet/state/
```

After the files are moved, start your NODE:

```
./start.sh
```

# 5.2 Restore/Start from Snapshots
Download latest snapshot to snapshots folder in your **NODE** directory:

```
cd /opt/FioTestnet/snapshots/
wget latest-snapshot.bin
```

After it downloads, run `start.sh` script with option `--snapshot` and snapshot file path:

```
cd /opt/FioTestnet
./start.sh --snapshot /opt/FioTestnet/snapshots/latest-snapshot.bin
```

# 6. Useful Information

## Create FIO key pair

You can create a FIO key pair using the clio command:

```
./clio.sh create key -f your-address.txt
```

Or using [the monitor](http://monitor.testnet.fioprotocol.io/#createKey).

**Always store your keypair information, including generated actor name.**

## Useful links

- [Faucet](http://monitor.testnet.fioprotocol.io/#faucet)
- [register FIO address](http://monitor.testnet.fioprotocol.io/#account)
- [Monitor BP Registration](http://monitor.testnet.fioprotocol.io/#register)
- [API requests](http://monitor.testnet.fioprotocol.io/#api)
- [P2P endpoints](http://monitor.testnet.fioprotocol.io/#p2p)
- [API endpoints](http://monitor.testnet.fioprotocol.io/#apiendpoints)

## Other Tools/Examples

- In [scripts folder](./scripts/) you can find script examples: how to register bp, stake, vote, claim rewards, etc.
- Vote using monitor.  Monitor can prepare the clio command, or send the command through Scatter.