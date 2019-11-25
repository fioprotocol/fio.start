#!/bin/bash
################################################################################
#
# FIO tools
#
# Created by CryptoLions.io..
# Git Hub: https://github.com/fioprotocol/fio.start
#
###############################################################################

DIR="/opt/FioTestnet/fioWallet"

    if [ -f $DIR"/wallet.pid" ]; then
        pid=$(cat $DIR"/wallet.pid")
        echo $pid
        kill $pid
        rm -r $DIR"/wallet.pid"

        echo -ne "Stoping Wallet"

        while true; do
            [ ! -d "/proc/$pid/fd" ] && break
            echo -ne "."
            sleep 1
        done
        echo -ne "\rWallet stopped. \n"

    fi

