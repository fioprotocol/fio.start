#!/bin/bash
################################################################################
#
# FIO tools
#
# Created by CryptoLions.io
# Git Hub: https://github.com/fioprotocol/fio.tools
#
###############################################################################

FIOBINDIR="/opt/bin/bin"

WALLETHOST="127.0.0.1"
WALLETPORT="3000"

#NODEHOST="127.0.0.1"
#NODEPORT="8888"

NODEHOST="testnet.fioprotocol.io"
NODEPORT="443"



$FIOBINDIR/cleos -u https://$NODEHOST:$NODEPORT --wallet-url http://$WALLETHOST:$WALLETPORT "$@"
