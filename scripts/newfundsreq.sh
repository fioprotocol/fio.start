#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

payerfioAddress="bk:test"
payeefioAddress="bk:test"
content="211111111122222222233333333344444444455555555566666666667777777777"
actor=omctgc4bfgxk
tpid=""
maxfee=0

./cleos.sh push action fio.reqobt newfundsreq '{"payer_fio_address":"'$payerfioAddress'","payee_fio_address":"'$payeefioAddress'","content":"'${content}'","max_fee":'$maxfee',"tpid":"'$tpid'","actor":"'$actor'"}' -p $actor@active

#Example
#./cleos.sh push action fio.reqobt newfundsreq '{"payer_fio_address":"bk:test","payee_fio_address":"bk:test","content":"211111111122222222233333333344444444455555555566666666667777777777","max_fee":0,"tpid":"","actor":"omctgc4bfgxk"}' -p omctgc4bfgxk@active
