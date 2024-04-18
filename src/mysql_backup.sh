#!/bin/bash

# Database credentials
DB_USER="username"
DB_PASSWORD="password"
DB_NAME="database_name"

# Backup directory
BACKUP_DIR="/path/to/backup/directory"

# Create backup file
BACKUP_FILE="$BACKUP_DIR/$DB_NAME-$(date +%Y%m%d).sql"

# Dump database
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_FILE
