#!/bin/bash
###############################################################################
#
# FIO tools
#
# Created by CryptoLions.io
# Git Hub: https://github.com/fioprotocol/fio.tools
#
#  Can be used directly from console: 
#  ./convert.sh <FIO PUB KEY>
#
###############################################################################

# 1000000000 = 1.000000000 FIO

fioPubKey="FIO6dibuddHN5fioh3VczFXWJq4M3quFjvXoRKR5S9BwgxLNaYf5L"

if [[ $1 != "" ]]; then
    fioPubKey=$1
fi

./cleos.sh convert fiokey_to_account $fioPubKey

#Example
#./cleos.sh convert fiokey_to_account FIO6dibuddHN5fioh3VczFXWJq4M3quFjvXoRKR5S9BwgxLNaYf5L