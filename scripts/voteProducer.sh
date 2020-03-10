#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################


bps='["bp2-west@dapixbp","bp0-east@dapixbp","cryptolions@fiotestnet"]'
voter_fioAddres="cryptolions@fiotestnet"
voterActor=5tyuyv241iup
maxfee=600000000

./clio.sh push action eosio voteproducer '{"producers":'${bps}',"fio_address":"'$voter_fioAddres'","actor":"'$voterActor'","max_fee":"'$maxfee'"}' -p $voterActor@active

#Example
#./clio.sh push action eosio voteproducer '{"producers":["bp2-west@dapixbp","bp0-east@dapixbp","cryptolions@fiotestnet"],"fio_address":"cryptolions@fiotestnet","actor":"5tyuyv241iup","max_fee":"600000000"}' -p 5tyuyv241iup@active
