#!/bin/sh

# Check if the user has sudo privileges
if [ "$(id -u)" -ne 0 ]; then
    echo "You must have sudo privileges to run this script."
    exit 1
fi

# Check if borninfo is already installed in /usr/local/bin
if [ -f "/usr/local/bin/borninfo" ]; then
    echo " * Borninfo is already installed."
    exit 0
fi

echo ""

# Suppress output
echo "Updating package list..."
sudo apt-get update -y > /dev/null 2>&1

# Install required packages
echo "Installing necessary packages..."
sudo apt-get install -y util-linux net-tools sysstat > /dev/null 2>&1

# Check exists
if [ ! -f "borninfo" ]; then
    echo "Error: borninfo script not found in the current directory."
    exit 1
fi

# Copy to /usr/local/bin
echo "Installing borninfo to /usr/local/bin..."
sudo cp borninfo /usr/local/bin/ > /dev/null 2>&1

# Make the script executable
echo "Setting executable permissions..."
sudo chmod +x /usr/local/bin/borninfo > /dev/null 2>&1

# Verify
if command -v borninfo &> /dev/null; then
    echo "borninfo installed successfully."
else
    echo "Error: borninfo installation failed."
    exit 1
fi

echo ""
echo "+ Installation complete!"
echo ""