#!/bin/bash

echo "========================================================================"
echo " Your shadowsocksR server information"
echo ""
echo " server: $SS_SERVER_ADDR  port: $SS_SERVER_PORT password: $SS_PASSWORD  "
echo " timeout: $SS_TIMEOUT  encryption method: $SS_METHOD "
echo ""
echo " Please remember the password!"
echo "========================================================================"

ulimit -n 512000
python ./server.py -p $SS_SERVER_PORT -k $SS_PASSWORD -m $SS_METHOD -P $SS_PROTOCAL -o $SS_OBFS
