#!/bin/bash

print_all() {
    architecture=$(uname -a)
    cpu_physical=$(lscpu | grep '^Socket(s)' | awk '{print $2}')
    vcpu=$(nproc)
    memory_usage=$(free --mega | grep 'Mem' | awk '{printf("%d/%dMB (%.2f%%)", $3, $2, ($3 / $2) * 100)}')
    disk_usage=$(df -h --total | grep total | awk '{print $3 "/" $2 " (" $5 ")"}')
    cpu_load=$(sar -u 1 1 | tail -n 1 | awk '{print 100 - $8}')
    last_boot=$(who -b | awk '{print $3 " " $4}')
    lvm_use=$(lsblk | grep -q 'lvm' && echo yes || echo no)
    connections_tcp=$(netstat -an | grep ESTAB | wc -l)
    user_log=$(who | wc -l)
    network_ip=$(hostname -I)
    network_mac=$(cat /sys/class/net/enp0s3/address)
    sudo_count=$(journalctl -q _COMM=sudo | grep COMMAND | wc -l)

    cat << EOF
 # Architecture: $architecture
 # CPU physical : $cpu_physical
 # vCPU : $vcpu
 # Memory Usage: $memory_usage
 # Disk Usage: $disk_usage
 # CPU load: $cpu_load%
 # Last boot: $last_boot
 # LVM use: $lvm_use
 # Connections TCP : $connections_tcp ESTABLISHED
 # User log: $user_log
 # Network: IP $network_ip ($network_mac)
 # Sudo: $sudo_count
EOF
}

# Functions
print_architecture() {
    echo "# Architecture: $(uname -a)"
}

print_cpu_physical() {
    echo "# CPU physical: $(lscpu | grep '^Socket(s)' | awk '{print $2}')"
}

print_vcpu() {
    echo "# vCPU: $(nproc)"
}

print_memory() {
    memory_usage=$(free --mega | grep 'Mem' | awk '{printf("%d/%dMB (%.2f%%)", $3, $2, ($3 / $2) * 100)}')
    echo "# Memory Usage: $memory_usage"
}

print_disk() {
    disk_usage=$(df -h --total | grep total | awk '{print $3 "/" $2 " (" $5 ")"}')
    echo "# Disk Usage: $disk_usage"
}

print_cpu_load() {
    cpu_load=$(sar -u 1 1 | tail -n 1 | awk '{print 100 - $8}')
    echo "# CPU load: $cpu_load%"
}

print_last_boot() {
    last_boot=$(who -b | awk '{print $3 " " $4}')
    echo "# Last boot: $last_boot"
}

print_lvm() {
    lvm_use=$(lsblk | grep -q 'lvm' && echo yes || echo no)
    echo "# LVM use: $lvm_use"
}

print_tcp_connections() {
    connections_tcp=$(netstat -an | grep ESTAB | wc -l)
    echo "# Connections TCP: $connections_tcp ESTABLISHED"
}

print_user_log() {
    user_log=$(who | wc -l)
    echo "# User log: $user_log"
}

print_network() {
    network_ip=$(hostname -I)
    network_mac=$(cat /sys/class/net/enp0s3/address)
    echo "# Network: IP $network_ip ($network_mac)"
}

print_sudo_count() {
    sudo_count=$(journalctl -q _COMM=sudo | grep COMMAND | wc -l)
    echo "# Sudo: $sudo_count commands"
}

print_help() {
    cat << EOF

Usage: borninfo [OPTIONS]

Options:
  -a, --all              Show all information
  -r, --architecture     Show system architecture
  -c, --cpu-physical     Show number of physical CPUs
  -v, --vcpu             Show number of virtual CPUs
  -m, --memory           Show memory usage
  -d, --disk             Show disk usage
  -l, --cpu-load         Show CPU load
  -b, --last-boot        Show last boot time
      --lvm            Show if LVM is in use
  -t, --tcp              Show established TCP connections
  -u, --user-log         Show number of logged-in users
  -n, --network          Show network information (IP and MAC)
  -s, --sudo             Show number of sudo commands used
  -h, --help             Display this help message

EOF
}

# Choice
case "$1" in
    -a|--all)
        print_all
        ;;
    -r|--architecture)
        print_architecture
        ;;
    -c|--cpu-physical)
        print_cpu_physical
        ;;
    -v|--vcpu)
        print_vcpu
        ;;
    -m|--memory)
        print_memory
        ;;
    -d|--disk)
        print_disk
        ;;
    -l|--cpu-load)
        print_cpu_load
        ;;
    -b|--last-boot)
        print_last_boot
        ;;
    --lvm)
        print_lvm
        ;;
    -t|--tcp)
        print_tcp_connections
        ;;
    -u|--user-log)
        print_user_log
        ;;
    -n|--network)
        print_network
        ;;
    -s|--sudo)
        print_sudo_count
        ;;
    -h|--help)
        print_help
        ;;
    *)
        echo "Invalid option. Use -h or --help for usage information."
        ;;
esac