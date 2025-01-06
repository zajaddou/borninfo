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

To install **BornInfo** on your Debian system, follow these steps:

### Prerequisites 📝

- A Debian-based operating system (Debian, Ubuntu, etc.)
- Bash shell

### Steps 🚶‍♂️

1. **Clone the repository**:
   ```bash
   git clone https://github.com/zajaddou/borninfo.git
Navigate to the directory:

bash
Copy code
cd borninfo
Build the .deb package:

bash
Copy code
dpkg-deb --build borninfo
Install the package: After the .deb file is created, use dpkg to install it:

bash
Copy code
sudo dpkg -i borninfo.deb
Now, you can run the tool with the borninfo command from anywhere in your terminal.

Usage 💡
Options:
-a, --all: Show all system information.
-r, --architecture: Show system architecture.
-c, --cpu-physical: Show the number of physical CPUs.
-v, --vcpu: Show the number of virtual CPUs.
-m, --memory: Show memory usage.
-d, --disk: Show disk usage.
-l, --cpu-load: Show CPU load percentage.
-b, --last-boot: Show the last boot time.
--lvm: Show if LVM is in use.
-t, --tcp: Show established TCP connections.
-u, --user-log: Show the number of logged-in users.
-n, --network: Show network information (IP and MAC).
-s, --sudo: Show the number of sudo commands used.
-h, --help: Display this help message.
Example:
To show all available system information, run:

bash
Copy code
borninfo -a
To display memory usage only, use:

bash
Copy code
borninfo -m
Contributing 🤝
We welcome contributions to improve BornInfo. To contribute:

Fork the repository on GitHub.
Create a new branch for your changes.
Commit your changes and push to your fork.
Submit a pull request.
Please ensure that your code follows the project's coding conventions and includes relevant tests or documentation.

License 📝
BornInfo is licensed under the MIT License. See the LICENSE file for more details.

Contact 📬
For questions or feedback, feel free to open an issue on the GitHub repository or contact us directly at [zajaddou@student.1337.ma].

Thank you for using BornInfo! We hope this tool helps you manage and monitor your systems with ease. 😊