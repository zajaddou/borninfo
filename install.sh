#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    /usr/bin/echo "This script must be run as root (with sudo)."
    exit 1
fi

# Check if borninfo is already installed
if dpkg-query -l | /usr/bin/grep -q "^ii  borninfo "; then
    /usr/bin/echo "borninfo is already installed."
    exit 0
fi

# Get the version from the control file
version=$(/usr/bin/awk '/Version/ {print $2}' package/DEBIAN/control)

# Banner and version info
/usr/bin/echo -e "\n
  ____   v:$version         _        __        
 | __ )  ___  _ __ _ __ (_)_ __  / _| ___   
 |  _ \ / _ \| '__| '_ \| | '_ \| |_ / _ \  
 | |_) | (_) | |  | | | | | | | |  _| (_) | 
 |____/ \___/|_|  |_| |_|_|_| |_|_|  \___/  

"

# List of dependencies to check and install
dependencies=(
  "bash"
  "libc6"
  "procps"
  "sysstat"
  "net-tools"
  "coreutils"
  "systemd"
  "lsb-release"
  "util-linux"
  "iproute2"
)

sleep 0.2

# System update and upgrade
/usr/bin/echo -e " + System Update...\n"
/usr/bin/apt-get update -y > /dev/null 2>&1
/usr/bin/apt-get upgrade -y > /dev/null 2>&1

# Check and install dependencies
/usr/bin/echo " + Checking Dependencies..."
for dep in "${dependencies[@]}"; do
    if ! dpkg-query -W -f='${Status}' "$dep" 2>/dev/null | /usr/bin/grep -q "install ok installed"; then
        /usr/bin/echo " + Installing $dep..."
        /usr/bin/apt-get install -y "$dep" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            /usr/bin/echo " - Failed to install $dep. Please check manually."
            exit 1
        fi
    fi
done

# Add necessary permissions for postinst script
/usr/bin/echo " + Adding Permissions..."
/usr/bin/chmod -R 0755 package

# Compile the package
/usr/bin/echo " + Building Package..."
dpkg-deb --build package > /dev/null 2>&1

# Install the package
/usr/bin/echo " + Installing Package..."
dpkg -i package.deb > /dev/null 2>&1
if [ $? -ne 0 ]; then
    /usr/bin/echo " - Failed to install the package. Please check the package and dependencies."
    exit 1
fi

# Remove the .deb file after installation
/usr/bin/rm -rf package.deb

#ask the user if he want to add broninfo to crontab config file

read -p "# do you want to add this packeg in your crontab 'to run it every minute (for example)' ? [y/N] : " input
if [ $input = 'y' ] || [ $input = 'Y' ]; then
    read -p "|__\$ do you want to add it to user or root ? (put name of user) : " username
    read -p "|__\$ when do you like run broninfo ? (you can use crontab ruls like '*/2 * * * *') : " rul
    /usr/bin/echo "# Borninfo - crontab config file " >> package/etc/borninfo/cronfile.txt
    /usr/bin/echo -n $rul >> package/etc/borninfo/cronfile.txt
    /usr/bin/echo "/usr/bin/borninfo -a --msg" >> package/etc/borninfo/cronfile.txt
    /usr/bin/crontab -u $user package/etc/borninfo/crontile.txt
fi

# Final message
/usr/bin/echo -e "\n * Installation Complete! 🎉\n"
