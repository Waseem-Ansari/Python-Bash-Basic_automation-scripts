#!/bin/bash
#============================================================
#Linux Backup Script
#Task: Copy all .log files to /backup and compress them
#Author: Waseem Ansari
#============================================================
# Step 1: Define source and destination
SOURCE="/var/log"
DEST="/backup"
DATE=$(date +%Y-%m-%d-%H-%M-%S)
BACKUP_FILE="logs_backup_$DATE.tar.gz"

#step 2: Create backup folder if not exists
if [ ! -d "$DEST" ];then
	echo "Creating backup directory at $DEST..."
	sudo mkdir -p $DEST
	sudo chown $USER:$USER $DEST
fi

#step 3: Copy all .log files to backup folder
echo "Copying .log files..."
find $SOURCE -type f -name "*.log" -exec cp {} $DEST/ \;

#step 4: Compress all copied logs
echo "Compressing backup into $BACKUP_FILE..."
tar -czvf $DEST/$BACKUP_FILE -C $DEST*.log

# Step 5: Cleanup individual log files
echo "Cleaning up temporary .log files.."
find $DEST -type f -name "*.log" -delete

echo "Backup complete! File saved as: $DEST/$BACKUP_FILE"

