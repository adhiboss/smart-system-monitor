#!/bin/bash

SERVICE_NAME="smart-system-monitor.service"
SYSTEMD_PATH="/etc/systemd/system/$SERVICE_NAME"

echo "Uninstalling Smart System Monitor..."

# Stop and disable service
sudo systemctl stop $SERVICE_NAME 2>/dev/null
sudo systemctl disable $SERVICE_NAME 2>/dev/null

# Remove service file
if [ -f "$SYSTEMD_PATH" ]; then
    sudo rm $SYSTEMD_PATH
    echo "[OK] Removed systemd service file"
else
    echo "[SKIP] systemd service file not found"
fi

# Reload systemd
sudo systemctl daemon-reload
echo "[OK] systemd daemon reloaded"

echo "Uninstall complete."
echo "Note: logs/ folder is not deleted automatically."
