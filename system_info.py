import psutil

print("CPU Usage (%):", psutil.cpu_percent(interval=1))
print("Memory Usage (%):", psutil.virtual_memory().percent)
print("Total Memory (GB):", round(psutil.virtual_memory().total / (1024**3), 2))