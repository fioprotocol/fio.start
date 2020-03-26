#!/bin/bash
###############################################################################
#
# FIO tools
#
# Copied from CryptoLions telegram chat
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

fioAddress="cryptolions@fiotestnet"
actor=5tyuyv241iup

pub_addresses='[{"chain_code":"BTC","token_code":"BTC","public_address":"1BTCadress..."},{"chain_code":"ETH","token_code":"ETH","public_address":"0xethaddress..."}]'

./clio.sh push action fio.address addaddress '{"fio_address":"'$fioAddress'","public_addresses":'${pub_addresses}',"max_fee":0,"tpid":"rewards@wallet","actor":"'$actor'"}'  -p $actor@active
