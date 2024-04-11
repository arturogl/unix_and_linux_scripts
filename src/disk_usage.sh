#!/bin/bash

# Set the threshold for disk usage percentage
THRESHOLD=80

# Get disk usage information for all mounted filesystems
DISK_USAGE=$(df -h --output=source,pcent | grep -vE '^Filesystem|tmpfs|cdrom')

# Loop through each line of disk usage information
while IFS= read -r line; do
    # Extract filesystem and usage percentage
    filesystem=$(echo "$line" | awk '{print $1}')
    usage_percentage=$(echo "$line" | awk '{print $2}' | sed 's/%//')

    # Check if usage percentage is a valid integer
    if [[ "$usage_percentage" =~ ^[0-9]+$ ]]; then
        # Check if usage percentage exceeds the threshold
        if [ "$usage_percentage" -gt "$THRESHOLD" ]; then
            # Compose email message
            subject="Disk Usage Alert: $filesystem"
            message="Disk usage for $filesystem is $usage_percentage% which exceeds the threshold of $THRESHOLD%."

            # Send email notification (replace recipient's email address)
            # echo "$message" | mail -s "$subject" user@example.com
            echo "$message"
        fi
    else
        echo "Invalid usage percentage: $usage_percentage for filesystem: $filesystem"
    fi
done <<< "$DISK_USAGE"
