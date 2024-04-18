#!/bin/bash

# Database credentials
DB_USER="username"
DB_NAME="database_name"

# CSV file to import
CSV_FILE="/path/to/csv/file.csv"

# PostgreSQL bin directory (change if necessary)
PG_BIN_DIR="/usr/bin"

# PostgreSQL table to import data into
TABLE_NAME="your_table_name"

# Column to use for upsert (replace 'your_key_column' with the actual column name)
UPSERT_COLUMN="your_key_column"

# Run psql command to import CSV data into PostgreSQL table with upsert
$PG_BIN_DIR/psql -U $DB_USER -d $DB_NAME -c "\copy $TABLE_NAME FROM '$CSV_FILE' DELIMITER ',' CSV HEADER ON CONFLICT ($UPSERT_COLUMN) DO UPDATE SET column1 = excluded.column1, column2 = excluded.column2, ..." 

# Check if import was successful
if [ $? -eq 0 ]; then
    echo "Import successful."
else
    echo "Import failed."
fi
