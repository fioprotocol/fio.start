#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io; updated by ZenBlocks.io
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

v2endpoint=https://fio.eossweden.org
fioAddress="bp@zenblocks"
actor=p5fi5ywnitjc

lastclaimed=$(curl -X GET "$v2endpoint/v2/history/get_actions?account=$actor&filter=fio.treasury%3Abpclaim&limit=1&sort=desc&simple=true" -H "accept: application/json" | jq .simple_actions[0].timestamp -r)
#lastclaimed=$(curl -X GET "https://api.waxsweden.org/v2/history/get_actions?account=zenblockswax&filter=eosio%3Aclaimrewards&sort=desc&simple=true" -H "accept: application/json" | jq .simple_actions[0].timestamp -r)

if [ ! -z "$lastclaimed" ]
then
        claimed=$(date -d "${lastclaimed}" +"%s")
        now=$(date +"%s")
        diff=$(( $now - $claimed ))
        echo "lastclaimed:$claimed\nnow:$now\ndiff:$diff"

        if [ $diff > 14400 ] # allow claim every 4hrs min
        then
                # use pwd for new wallet specifically to store custom perm created with updateauth.sh
                ./clio.sh wallet unlock -n claims --password PW5DU5L385JT72HE8TJ295G295H27FDL58FY386H20Dh9e3i69ss8w
                ./clio.sh push action fio.treasury bpclaim '{"fio_address":"'$fioAddress'","actor":"'$actor'"}' -p $actor@claim
                ./clio.sh wallet lock -n claims
        fi
fi