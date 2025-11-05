#!/bin/bash
# To schedule this script every 30 minutes add this line in crontab:
# */30 * * * * /home/ubuntu/check_disk.sh >> /home/ubuntu/disk_check.log 2>$1
# Step 1: Get disk usage percentage (root partition only)
USAGE=$(df -h / | grep '/' | grep '/' | awk '{print $5}' | sed 's/%//g')

# Step 2: Define threshold
THRESHOLD=20

#Step 3: Check if usage > threshold
if [ "$USAGE" -gt "$THRESHOLD" ]; then
	echo "Disk usage is above $THRESHOLD%. Current: $USAGE%"

	#step 4: call python alert script
	/usr/bin/python3 /home/ubuntu/disk_alert.py "$USAGE"
else
	echo "Disk usage is under control: $USAGE%"
fi
