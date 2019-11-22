#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io
# Git Hub: https://github.com/fioprotocol/fio.tools
#
###############################################################################

fioAddress="cryptolions:fiotestnet"
actor=5tyuyv241iup
url="bpurl.io"
location=10
maxfee=40000000000

./cleos.sh push action eosio regproducer '{"fio_address":"'$fioAddress'","url":"'$url'","location":'$location',"actor":"'$actor'", "max_fee":"'$maxfee'"}' --permission $actor@active

#Example
#./cleos.sh push action eosio regproducer '{"fio_address":"cryptolions:fiotestnet","url":"CryptoLions.io","location":10,"actor":"5tyuyv241iup", "max_fee":"40000000000"}' --permission 5tyuyv241iup@active

