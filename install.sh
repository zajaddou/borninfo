#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root (with sudo)."
    exit 1
fi

# Check if borninfo is already installed
if dpkg-query -l | grep -q "^ii  borninfo "; then
    echo "borninfo is already installed."
    exit 0
fi

# Get the version from the control file
version=$(awk '/Version/ {print $2}' package/DEBIAN/control)

# Banner and version info
echo -e "\n
  ____   v:$version         _        __        
 | __ )  ___  _ __ _ __ (_)_ __  / _| ___   
 |  _ \ / _ \| '__| '_ \| | '_ \| |_ / _ \  
 | |_) | (_) | |  | | | | | | | |  _| (_) | 
 |____/ \___/|_|  |_| |_|_|_| |_|_|  \___/  

"

# Print the current working directory
pwd=$(pwd)

# List of dependencies to check and install
dependencies=(
  "bash"
  "libc6"
  "procps"
  "sysstat"
  "net-tools"
  "hostname"
  "coreutils"
  "systemd"
  "lsb-release"
  "util-linux"
  "iproute2"
)

sleep 0.2

# System update and upgrade
echo -e " + System Update...\n"
apt-get update -y > /dev/null 2>&1
apt-get upgrade -y > /dev/null 2>&1

# Check and install dependencies
echo " + Checking Dependencies..."
for dep in "${dependencies[@]}"; do
    if ! dpkg-query -W -f='${Status}' "$dep" 2>/dev/null | grep -q "install ok installed"; then
        echo " + Installing $dep..."
        apt-get install -y "$dep" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo " - Failed to install $dep. Please check manually."
            exit 1
        fi
    fi
done

# Add necessary permissions for postinst script
echo " + Adding Permissions..."
chmod 755 package/DEBIAN/postinst

# Compile the package
echo " + Building Package..."
dpkg-deb --build package > /dev/null 2>&1

# Install the package
echo " + Installing Package..."
dpkg -i package.deb > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo " - Failed to install the package. Please check the package and dependencies."
    exit 1
fi

# Remove the .deb file after installation
rm -rf package.deb

# Final message
echo -e "\n * Installation Complete! 🎉\n"
