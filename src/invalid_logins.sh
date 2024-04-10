#!/bin/bash

# Define the email address where you want to send the report
recipient="your_email@example.com"

# Run journalctl command to get the output for failed SSH login attempts
failed_attempts=$(journalctl _SYSTEMD_UNIT=ssh.service | egrep "Failed|Failure")

# Extract IP addresses and usernames from the failed attempts
ip_user_count=$(echo "$failed_attempts" | grep -o 'user.*.from.*.' | awk '{print $4"_"$2}' | sort | uniq -c )

# Prepare email content
email_subject="SSH Failed Login Report"
email_body="Number of invalid logins by IP and User:\n\n$ip_user_count"

# Send the email
# echo -e "$email_body" | mail -s "$email_subject" "$recipient"
echo -e "$email_body"

echo "Email sent successfully."
