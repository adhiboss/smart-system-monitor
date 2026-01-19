#!/bin/bash

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

CPU_LOAD=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1)
MEM_USED=$(free -m | awk 'NR==2{printf "%s/%sMB", $3,$2 }')
DISK_USED=$(df -h / | awk 'NR==2{print $5}')

echo "$TIMESTAMP,$CPU_LOAD,$MEM_USED,$DISK_USED" >> logs/system_metrics.csv
