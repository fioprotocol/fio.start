#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io; Updated by ZenBlocks
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

# actor is hash from pub key which was used for FIO Address registration.
# To convert key to actor name you can use clio:
#./clio.sh convert fiokey_to_account FIO6dibuddHN5fioh3VczFXWJq4M3quFjvXoRKR5S9BwgxLNaYf5L

fioAddress="bp@zenblocks"
actor=p5fi5ywnitjc
maxfee=200000000000

./clio.sh push action eosio unregprod '{"fio_address":"'$fioAddress'","actor":"'$actor'", "max_fee":"'$maxfee'"}' --permission $actor@active
