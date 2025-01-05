#!/bin/bash

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
