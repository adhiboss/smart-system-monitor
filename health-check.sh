#!/bin/bash

echo "===== SYSTEM HEALTH CHECK ====="
echo "Date: $(date)"
echo ""

echo "CPU Load:"
uptime
echo ""

echo "Memory Usage:"
free -h
echo ""

echo "Disk Usage:"
df -h
echo ""

echo "Top 5 Processes:"
ps aux --sort=-%mem | head -n 6
echo ""

echo "Open Ports:"
ss -tuln
echo ""

echo "================================"
