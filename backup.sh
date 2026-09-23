
#!/bin/bash

SOURCE_DIR="/home/ubuntu/linux_server_monitor/logs"
BACKUP_DIR="/home/ubuntu/linux_server_monitor/backups"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_FILE="$BACKUP_DIR/backup_$DATE.tar.gz"

tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

if [ $? -eq 0 ]
then
    echo "Backup created successfully:"
    echo "$BACKUP_FILE"
else
    echo "Backup failed"
fi

