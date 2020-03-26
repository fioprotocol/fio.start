#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io; updated by ZenBlocks.io
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

fioAddress="bp@zenblocks"
actor=p5fi5ywnitjc

# use pwd for new wallet specifically to store custom perm created with updateauth.sh
./clio.sh wallet unlock -n claims --password PW5DU5L385JT72HE8TJ295G295H27FDL58FY386H20Dh9e3i69ss8w
./clio.sh push action fio.treasury bpclaim '{"fio_address":"'$fioAddress'","actor":"'$actor'"}' -p $actor@claim
./clio.sh wallet lock -n claims
