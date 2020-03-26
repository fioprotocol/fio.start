#!/bin/bash
###############################################################################
#
# FIO tools
#
# Template from CryptoLions.io; Created by ZenBlocks.io
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

actor=p5fi5ywnitjc
code=fio.treasury
action=bpclaim
permission=claim
maxfee=20000000000

./clio.sh push action eosio linkauth '{"max_fee":"'$maxfee'","account":"'$actor'","requirement":"'$permission'","type":"'$action'","code":"'$code'"}' -p $actor@active