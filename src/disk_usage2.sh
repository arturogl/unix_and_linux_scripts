# Example: ./disk_usage.sh sda

# Function to print script usage
print_usage() {
    echo "Usage: $0 [disk_pattern]"
    echo "Computes and displays total disk usage for the system."
    echo "If a disk pattern is specified (e.g., 'sda'), only matches to that pattern are displayed."
    echo "If no pattern is specified, all disk partitions are displayed."
}

# Function to list disk partitions and usage
list_disks() {
    df -h | awk 'NR>1 && !/^tmpfs/ && !/^udev/ {print $1, $3, $2, $5}'
}

# Main function
main() {
    if [[ $# -gt 1 ]]; then
        echo "Error: Incorrect number of arguments."
        print_usage
        exit 1
    fi

    local disk_pattern="${1}"

    if [[ -z "$disk_pattern" ]]; then
        echo "Disk usage for all disk partitions:"
        list_disks
    else
        local result
        result=$(df -h | awk -v pattern="^$disk_pattern" '$1 ~ pattern && !/^tmpfs/ && !/^udev/ {print $1, $3, $2, $5}')

        if [[ -z "$result" ]]; then
            echo "No disk matches the pattern '$disk_pattern'."
            exit 1
        else
            echo -e "Disk usage for pattern \"$disk_pattern\":\n$result"
        fi
    fi
}

main "$@"
