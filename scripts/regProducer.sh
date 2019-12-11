#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

fioAddress="cryptolions:fiotestnet"
signkey="FIO6dibuddHN5fioh3VczFXWJq4M3quFjvXoRKR5S9BwgxLNaYf5L"
actor=5tyuyv241iup
url="bpurl.io"
location=10
maxfee=40000000000

./clio.sh push action eosio regproducer '{"fio_address":"'$fioAddress'","owner_fio_public_key":"'$signkey'","url":"'$url'","location":'$location',"actor":"'$actor'", "max_fee":"'$maxfee'"}' --permission $actor@active

#Example
#./clio.sh push action eosio regproducer '{"fio_address":"cryptolions:fiotestnet","url":"CryptoLions.io","location":10,"actor":"5tyuyv241iup", "max_fee":"40000000000"}' --permission 5tyuyv241iup@active

