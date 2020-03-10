#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

fioDomain="testdomain"
ownerfiopubkey="FIO8DVRKLV5UTjgSign9Ub2pVFXRmrbcQti65yjmxZwo87oBG35dy"
actor=qvmfwlz4fffs
maxfee=800000000000
tpid=""

./clio.sh push action fio.address regdomain '{"fio_domain":"'$fioDomain'","owner_fio_public_key":"'$ownerfiopubkey'","max_fee":"'$maxfee'","actor":"'$actor'","tpid":"'$tpid'"}' -p $actor@active -f

#Example
#./clio.sh push action fio.address regdomain '{"fio_domain":"testdomain","owner_fio_public_key":"FIO8DVRKLV5UTjgSign9Ub2pVFXRmrbcQti65yjmxZwo87oBG35dy","max_fee":"800000000000","actor":"qvmfwlz4fffs","tpid":""}' -p qvmfwlz4fffs@active -f



