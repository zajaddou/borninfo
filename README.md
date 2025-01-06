# Let's generate the README file for download

readme_content = """
# BornInfo - System Information Tool ![borninfo](https://img.shields.io/badge/BornInfo-Tool-blue)

**BornInfo** is a lightweight command-line utility designed to help users gather critical information about their system. It provides quick access to essential system details, including CPU, memory, disk usage, network configurations, and much more. 🚀

This tool is ideal for system administrators, developers, or anyone who needs to quickly check the status and health of their machine.

## Features 📋

- 🖥 **System Architecture**: Displays system architecture information (e.g., kernel version, machine type).
- ⚙️ **CPU Information**: Shows physical CPU count and virtual CPUs (vCPUs).
- 💾 **Memory Usage**: Displays memory usage with total, used, and free memory statistics.
- 💻 **Disk Usage**: Provides disk space usage, including the total, used, and available space.
- 🏋️ **CPU Load**: Shows real-time CPU load percentage.
- 🕒 **Last Boot Time**: Displays the time and date of the last system boot.
- 🔒 **LVM Support**: Indicates if Logical Volume Management (LVM) is in use.
- 🌐 **Network Info**: Displays local IP and MAC addresses of the system.
- 🔌 **Active TCP Connections**: Lists the number of established TCP connections.
- 👤 **User Sessions**: Displays the number of users currently logged in.
- 🛠 **Sudo Commands**: Tracks and displays the number of sudo commands executed.

## Installation 🛠️

### Prerequisites 📝

- A Debian-based Linux operating system (e.g., Ubuntu, Debian)
- Bash shell

### Steps to Install 🚶‍♂️

1. **Clone the repository**:
   Clone the repository from GitHub to your local machine:

   ```bash
   git clone https://github.com/zajaddou/borninfo.git
