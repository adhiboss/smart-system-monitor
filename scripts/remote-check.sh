#!/bin/bash

SERVER=$1

if [ -z "$SERVER" ]; then
  echo "Usage: ./remote-check.sh user@server-ip"
  exit 1
fi

echo "Checking remote server: $SERVER"

ssh -o ConnectTimeout=5 $SERVER << 'EOF'
echo "---- Remote System Info ----"
hostname
uptime
free -h
df -h /
echo "----------------------------"
EOF
