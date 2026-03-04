#!/bin/bash

SERVERS_FILE="servers.txt"

printf "%-20s %-10s %-10s %-10s\n" "SERVER" "CPU%" "MEM%" "DISK%"
printf "%-20s %-10s %-10s %-10s\n" "------" "----" "----" "-----"

while read -r SERVER; do

DATA=$(ssh -o ConnectTimeout=5 $SERVER "
CPU=\$(top -bn1 | grep 'Cpu(s)' | awk '{print 100-\$8}')
MEM=\$(free | awk '/Mem:/ {printf(\"%.0f\"), \$3/\$2*100}')
DISK=\$(df / | awk 'NR==2 {print \$5}' | sed 's/%//')
echo \"\$CPU \$MEM \$DISK\"
" 2>/dev/null)

CPU=$(echo $DATA | awk '{print int($1)}')
MEM=$(echo $DATA | awk '{print $2}')
DISK=$(echo $DATA | awk '{print $3}')

printf "%-20s %-10s %-10s %-10s\n" "$SERVER" "$CPU" "$MEM" "$DISK"

done < "$SERVERS_FILE"
