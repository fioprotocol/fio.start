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

./cleos.sh push action fio.treasury bpclaim '{"fio_address":"'$fioAddress'","actor":"'$actor'"}' -p $actor@active

#Example
#./cleos.sh push action fio.treasury bpclaim '{"fio_address":"cryptolions:fiotestnet","actor":"5tyuyv241iup"}' -p 5tyuyv241iup@active
