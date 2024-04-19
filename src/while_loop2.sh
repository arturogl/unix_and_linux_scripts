#!/bin/bash

# Check if the file path is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <file>"
    exit 1
fi

file="$1"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "File '$file' does not exist."
    exit 1
fi

# Read the file line by line and check for lines containing "Error"
while IFS= read -r line; do
    if [[ "$line" == *Error* ]]; then
        echo "Error detected in line: $line"
    fi
done < "$file"
