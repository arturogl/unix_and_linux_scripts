#!/bin/bash

# Database credentials
DB_USER="username"
DB_PASSWORD="password"
DB_NAME="database_name"

# Output directory
OUTPUT_DIR="/path/to/output/directory"

# CSV filename
CSV_FILE="$OUTPUT_DIR/data_export_$(date +%Y%m%d%H%M%S).csv"

# Run mysql command to export data to CSV
mysql -u $DB_USER -p$DB_PASSWORD -D $DB_NAME -e "SELECT * FROM your_table_name" -B -e "SELECT * INTO OUTFILE '$CSV_FILE' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n'"

# Check if export was successful
if [ $? -eq 0 ]; then
    echo "Export successful. CSV file saved as: $CSV_FILE"
else
    echo "Export failed."
fi
