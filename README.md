# 🖥️ Smart System Monitor

A lightweight Linux system monitoring script that logs CPU, memory, disk, and network usage into a CSV file for analysis and automation.

---

## 📌 Features

- Logs system metrics with timestamp
- Captures:
  - CPU usage (%)
  - Load average (1 min)
  - Memory usage (used/total + %)
  - Disk usage (used/total + %)
  - Network interface RX/TX bytes
- Stores data in CSV format (easy to analyze)
- Designed for automation using cron

---

## 📂 Project Structure

```bash
smart-system-monitor/
├── monitor.sh
├── logs/
│   └── system_metrics.csv
└── README.md
