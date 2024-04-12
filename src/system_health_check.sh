#!/bin/bash

# Function to check CPU usage
check_cpu_usage() {
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo "CPU Usage: $cpu_usage%"
}

# Function to check memory usage
check_memory_usage() {
    memory=$(free -m | grep Mem | awk '{printf "Total: %.2f GB, Used: %.2f GB, Free: %.2f GB, Usage: %.2f%%", $2/1024,$3/1024,$4/1024,($3/$2)*100}')
    echo "Memory Usage: $memory"
}

# Function to check disk usage
check_disk_usage() {
    disk=$(df -h / | awk 'NR==2{printf "Total: %s, Used: %s, Available: %s, Usage: %s", $2,$3,$4,$5}')
    echo "Disk Usage: $disk"
}

# Function to check system uptime
check_system_uptime() {
    uptime=$(uptime | awk '{print $3 " " $4 " " $5}')
    echo "System Uptime: $uptime"
}

# Main function to run all checks
main() {
    echo "System Health Check:"
    echo "---------------------"
    check_cpu_usage
    echo "---------------------"
    check_memory_usage
    echo "---------------------"
    check_disk_usage
    echo "---------------------"
    check_system_uptime
    echo "---------------------"
}

main
