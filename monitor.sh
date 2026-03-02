#!/bin/bash

LOG_DIR="logs"
CSV_FILE="$LOG_DIR/system_metrics.csv"

mkdir -p "$LOG_DIR"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
HOSTNAME=$(hostname)
UPTIME=$(uptime -p)

# CPU Usage %
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

# Load Average (1 min)
LOAD_AVG=$(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | xargs)

# Memory
MEM_TOTAL=$(free -m | awk 'NR==2{print $2}')
MEM_USED=$(free -m | awk 'NR==2{print $3}')
MEM_PERCENT=$(free | awk 'NR==2{printf "%.2f", $3/$2*100}')

# Disk
DISK_TOTAL=$(df -h / | awk 'NR==2{print $2}')
DISK_USED=$(df -h / | awk 'NR==2{print $3}')
DISK_PERCENT=$(df -h / | awk 'NR==2{print $5}' | tr -d '%')

# Network (eth0 or wlan0 may vary in WSL, so we take first interface)
NET_IFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)

RX_BYTES=$(cat /sys/class/net/$NET_IFACE/statistics/rx_bytes 2>/dev/null)
TX_BYTES=$(cat /sys/class/net/$NET_IFACE/statistics/tx_bytes 2>/dev/null)

# Add CSV header if file doesn't exist
if [ ! -f "$CSV_FILE" ]; then
    echo "timestamp,hostname,uptime,cpu_usage_percent,load_avg_1min,mem_used_mb,mem_total_mb,mem_percent,disk_used,disk_total,disk_percent,net_iface,rx_bytes,tx_bytes" >> "$CSV_FILE"
fi

# Append metrics
echo "$TIMESTAMP,$HOSTNAME,\"$UPTIME\",$CPU_USAGE,$LOAD_AVG,$MEM_USED,$MEM_TOTAL,$MEM_PERCENT,$DISK_USED,$DISK_TOTAL,$DISK_PERCENT,$NET_IFACE,$RX_BYTES,$TX_BYTES" >> "$CSV_FILE"

echo "Metrics logged at $TIMESTAMP into $CSV_FILE"
# Disk Usage Check
DISK_THRESHOLD=80

USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

if [ "$USAGE" -gt "$DISK_THRESHOLD" ]; then
    echo "[ALERT] Disk usage is above ${DISK_THRESHOLD}% (Current: ${USAGE}%)"
else
    echo "[OK] Disk usage is ${USAGE}%"
fi
