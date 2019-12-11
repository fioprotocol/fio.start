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
actor=5tyuyv241iup

./clio.sh push action fio.treasury bpclaim '{"fio_address":"'$fioAddress'","actor":"'$actor'"}' -p $actor@active

#Example
#./clio.sh push action fio.treasury bpclaim '{"fio_address":"cryptolions:fiotestnet","actor":"5tyuyv241iup"}' -p 5tyuyv241iup@active
