#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io
# Git Hub: https://github.com/fioprotocol/fio.tools
#
###############################################################################

fioAddres="testaddres:testdomain"
ownerfiopubkey="FIO8DVRKLV5UTjgSign9Ub2pVFXRmrbcQti65yjmxZwo87oBG35dy"
actor=qvmfwlz4fffs
maxfee=40000000000
tpid=""

./cleos.sh push action fio.address regaddress '{"fio_address":"'$fioAddres'","owner_fio_public_key":"'$ownerfiopubkey'","max_fee":"'$maxfee'","actor":"'$actor'","tpid":"'$tpid'"}' -p $actor@active -f

#Example
#./cleos.sh push action fio.address regaddress '{"fio_address":"testaddres:testdomain","owner_fio_public_key":"FIO8DVRKLV5UTjgSign9Ub2pVFXRmrbcQti65yjmxZwo87oBG35dy","max_fee":"40000000000","actor":"qvmfwlz4fffs","tpid":""}' -p qvmfwlz4fffs@active -f
