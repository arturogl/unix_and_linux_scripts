#!/bin/bash

# Set the size of the test file (1GB in this case)
file_size="1G"

# Set the output file name
output_file="test_file.dat"

# Use dd command to create the test file
dd if=/dev/zero of="$output_file" bs=1M count=1024 status=progress

echo "Test file created: $output_file"
