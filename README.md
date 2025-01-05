
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

To install **BornInfo** on your system, follow the instructions below:

### Prerequisites 📝

- A Linux-based operating system (Ubuntu, Debian, CentOS, Fedora, etc.)
- Bash shell

### Steps 🚶‍♂️

1. **Clone the repository**:
   ```bash
   git clone https://github.com/zajaddou/borninfo.git
   ```

2. **Make the script executable**:
   Once you've downloaded the script, make it executable by running the following command:

   ```bash
   chmod +x borninfo.sh
   ```

3. **Run the script**:
   Now you can run the script directly by navigating to its location and executing it:

   ```bash
   ./borninfo.sh
   ```

   Or, to use it globally, you can move it to a directory in your `PATH` (e.g., `/usr/local/bin`):

   ```bash
   sudo mv borninfo.sh /usr/local/bin/borninfo
   ```

   Now, you can simply run `borninfo` from anywhere in your terminal.

## Usage 💡

### Options:

- `-a, --all`: Show all system information.
- `-r, --architecture`: Show system architecture.
- `-c, --cpu-physical`: Show the number of physical CPUs.
- `-v, --vcpu`: Show the number of virtual CPUs.
- `-m, --memory`: Show memory usage.
- `-d, --disk`: Show disk usage.
- `-l, --cpu-load`: Show CPU load percentage.
- `-b, --last-boot`: Show the last boot time.
- `--lvm`: Show if LVM is in use.
- `-t, --tcp`: Show established TCP connections.
- `-u, --user-log`: Show the number of logged-in users.
- `-n, --network`: Show network information (IP and MAC).
- `-s, --sudo`: Show the number of sudo commands used.
- `-h, --help`: Display this help message.

### Example:

To show all available system information, run:

```bash
borninfo -a
```

To display memory usage only, use:

```bash
borninfo -m
```

## Contributing 🤝

We welcome contributions to improve **BornInfo**. To contribute:

1. Fork the repository on GitHub.
2. Create a new branch for your changes.
3. Commit your changes and push to your fork.
4. Submit a pull request.

Please ensure that your code follows the project's coding conventions and includes relevant tests or documentation.

## License 📝

**BornInfo** is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Contact 📬

For questions or feedback, feel free to open an issue on the GitHub repository or contact us directly at [zajaddou@student.1337.ma].

---

Thank you for using **BornInfo**! We hope this tool helps you manage and monitor your systems with ease. 😊
