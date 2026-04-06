#!/bin/bash

#check if the user provided the directory argument
if [ -z "$1" ]; then
        echo "Please provide the directory file. Usage: log-archive <log-directory>"
        exit 1
fi

LOG_DIR=$1

#Define the path you want to store archived-logs
ARCHIVE_DIR="archived_logs"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"

#Create the storage directory if it doesn't exist

mkdir -p "$ARCHIVE_DIR"

#Compress the logs into a .tar.gz file
#-c: create, -z:gzip, -f:filename
tar -czf "${ARCHIVE_DIR}/${ARCHIVE_NAME}" "$LOG_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
        echo " Logs from $LOG_DIR archived successfully to ${ARCHIVE_DIR}/${ARCHIVE_NAME}"
        # logs the date and time of the archive to a file
        echo "[$(date)] Archived $LOG_DIR to $ARCHIVE_NAME" >> archive_log.txt

else
        echo "ERROE: Failed to archive logs."
        exit 1
fi
