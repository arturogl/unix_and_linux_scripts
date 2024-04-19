#!/bin/bash

# List of remote hosts
HOSTS=(
    "user1@host1"
    "user2@host2"
    "user3@host3"
    # Add more hosts as needed
)

# Path to the script to be executed remotely
REMOTE_SCRIPT="/path/to/your/script.sh"

# Loop through each remote host and execute the script
for host in "${HOSTS[@]}"; do
    echo "Executing script on $host..."
    ssh "$host" "bash -s" < "$REMOTE_SCRIPT"
    echo "Script executed on $host."
done

echo "Script executed on all hosts."
