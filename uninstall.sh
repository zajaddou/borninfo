#!/bin/sh

# Sudo Check 
if [ "$(id -u)" -ne 0 ]; then
    echo "You must have sudo privileges to run this script."
    exit 1
fi

# Check if borninfo is installed
if [ ! -f "/usr/local/bin/borninfo" ]; then
    echo " * Borninfo is not installed."
    exit 0
fi

echo ""

# Remove borninfo from /usr/local/bin
echo "Removing borninfo from /usr/local/bin..."
sudo rm -f /usr/local/bin/borninfo

# Clean up orphaned packages
sudo apt-get autoremove -y > /dev/null 2>&1

# Verify uninstallation
if [ ! -f "/usr/local/bin/borninfo" ]; then
    echo "Cleaning up ..."
else
    echo "Error: borninfo removal failed."
    exit 1
fi

echo ""
echo "+ Uninstallation complete!"
echo ""