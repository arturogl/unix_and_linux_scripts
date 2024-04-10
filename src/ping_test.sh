#!/bin/bash

# Function to send email notification
send_email_notification() {
    local recipient="$1"
    local hostname="$2"

    # Email subject
    local subject="Server Alert: $hostname is not responding"

    # Email body
    local body="The server $hostname is not responding to ping. Please investigate."

    # Send email using the 'mail' command
    echo "$body" | mail -s "$subject" "$recipient"
}

# Read hostnames from file
filename="hostnames.txt"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: $filename does not exist."
    exit 1
fi

# Loop through each hostname in the file
while IFS= read -r hostname; do
    # Perform ping check
    if ping -c 1 "$hostname" &> /dev/null; then
        echo "$hostname is reachable."
    else
        echo "$hostname is not reachable. Sending email notification..."
        # Replace 'recipient@example.com' with your email address
        # send_email_notification "recipient@example.com" "$hostname"
    fi
done < "$filename"
