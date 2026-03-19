import psutil

CPU_THRESHOLD = 80
MEM_THRESHOLD = 80

cpu = psutil.cpu_percent(interval=1)
mem = psutil.virtual_memory().percent

print("System Alert Monitor")
print("--------------------")

if cpu > CPU_THRESHOLD:
    print(f"High CPU usage detected: {cpu}%")
else:
    print(f"CPU usage normal: {cpu}%")

if mem > MEM_THRESHOLD:
    print(f"High Memory usage detected: {mem}%")
else:
    print(f"Memory usage normal: {mem}%")
