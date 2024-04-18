#!/bin/bash

# Database credentials
DB_USER="username"
DB_NAME="database_name"

# Output directory
OUTPUT_DIR="/path/to/output/directory"

# CSV filename
CSV_FILE="$OUTPUT_DIR/data_export_$(date +%Y%m%d%H%M%S).csv"

# PostgreSQL bin directory (change if necessary)
PG_BIN_DIR="/usr/bin"

# Run psql command to export data to CSV
$PG_BIN_DIR/psql -U $DB_USER -d $DB_NAME -c "COPY (SELECT * FROM your_table_name) TO STDOUT WITH CSV HEADER" > $CSV_FILE

# Check if export was successful
if [ $? -eq 0 ]; then
    echo "Export successful. CSV file saved as: $CSV_FILE"
else
    echo "Export failed."
fi
