# Smart System Monitor

A simple Linux system monitoring project built using Bash scripting and cron automation.

This project collects system information like CPU load, memory usage, and disk usage, and saves it to a log file automatically.

---

## Features

- Collects:
  - CPU load
  - Memory usage
  - Disk usage
- Saves data to a CSV log file
- Runs automatically every minute using cron
- Easy to understand and extend

---

## Project Structure

smart-system-monitor/
├── scripts/ 

│ └── collect_metrics.sh

├── logs/

│ └── system_metrics.csv

├── README.md


---

## How to Run

Run the script manually:

```bash
./scripts/collect_metrics.sh
cat logs/system_metrics.csv

Cron entry used:

* * * * * /home/adhi/smart-system-monitor/scripts/collect_metrics.sh

What I Learned

Writing basic Bash scripts

Collecting system information

Using cron for task automation

Using Git and GitHub for version control

--Built by AI , this makes me even more system focused with help of AI

