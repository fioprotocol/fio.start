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
permission=claim
parent=active
key=FIO6dibuddHN5fioh3VczFXWJq4M3quFjvXoRKR5S9BwgxLNaYf5L
maxfee=20000000000

./clio.sh push action eosio updateauth '{"max_fee":"'$maxfee'","account":"'$actor'","permission":"'$permission'","parent":"'$parent'","auth":{"accounts":[],"keys":[{"key":"'$key'","weight":"1"}],"threshold":"1","waits":[]}}' -p $actor@active