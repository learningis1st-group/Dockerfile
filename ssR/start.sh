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
python ./server.py
