#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

# actor is hash from pub key which was used for FIO Address registration.
# To convert key to actor name you can use clio:
#./clio.sh convert fiokey_to_account FIO6dibuddHN5fioh3VczFXWJq4M3quFjvXoRKR5S9BwgxLNaYf5L

#Locations
#10  East Asia
#20  Australia
#30  West Asia
#40  Africa
#50  Europe
#60  East North America
#70  South America
#80  West North America

fioAddress="cryptolions@fiotestnet"
actor=5tyuyv241iup

signkey="FIO5J3K9zd6e9u4d1whTPx1jUZ1cdJqSvHqcKVYma9wZdfyfaFiob"
url="bpurl.io"
location=50
maxfee=40000000000

./clio.sh push action eosio regproducer '{"fio_address":"'$fioAddress'","fio_pub_key":"'$signkey'","url":"'$url'","location":'$location',"actor":"'$actor'", "max_fee":"'$maxfee'"}' --permission $actor@active

#Example
#./clio.sh push action eosio regproducer '{"fio_address":"cryptolions@fiotestnet","fio_pub_key":"FIO6dibuddHN5fioh3VczFXWJq4M3quFjvXoRKR5S9BwgxLNaYf5L","url":"CryptoLions.io","location":10,"actor":"5tyuyv241iup", "max_fee":"40000000000"}' --permission 5tyuyv241iup@active

