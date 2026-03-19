import shutil

total, used, free = shutil.disk_usage("/")

print("Disk Usage Monitor")
print("------------------")

print(f"Total: {total // (1024**3)} GB")
print(f"Used : {used // (1024**3)} GB")
print(f"Free : {free // (1024**3)} GB")

usage_percent = used / total * 100

print(f"Usage: {usage_percent:.2f}%")

if usage_percent > 80:
    print("Warning: Disk usage above 80%")
else:
    print("Disk usage within normal range")
