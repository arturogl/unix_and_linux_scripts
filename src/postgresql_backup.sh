#!/bin/bash

# Database credentials
DB_USER="username"
DB_NAME="database_name"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Create backup file with timestamp
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$(date +%Y%m%d%H%M%S).sql"

# PostgreSQL bin directory (change if necessary)
PG_BIN_DIR="/usr/bin"

# Dump database
$PG_BIN_DIR/pg_dump -U $DB_USER -Fc $DB_NAME > $BACKUP_FILE

# Check if backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful. File saved as: $BACKUP_FILE"
else
    echo "Backup failed."
fi
