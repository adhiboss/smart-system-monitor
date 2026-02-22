#!/bin/bash

echo "Installing Smart System Monitor..."

sudo mkdir -p /opt/smart-system-monitor
sudo cp monitor.sh health-check.sh /opt/smart-system-monitor/

sudo chmod +x /opt/smart-system-monitor/*.sh

echo "Installation complete."
echo "Run from: /opt/smart-system-monitor/"
