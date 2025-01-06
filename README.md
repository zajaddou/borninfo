# BornInfo - System Information Tool 🚀

BornInfo is a lightweight command-line utility designed to help users gather critical information about their system. It provides quick access to essential system details, including CPU, memory, disk usage, network configurations, and much more.

## Features 📋

- 🖥️ **System Architecture**: Displays system architecture information (kernel version, machine type)
- ⚙️ **CPU Information**: Shows physical CPU count and virtual CPUs (vCPUs)
- 💾 **Memory Usage**: Displays memory usage with total, used, and free memory statistics
- 💻 **Disk Usage**: Provides disk space usage, including total, used, and available space
- 🏋️ **CPU Load**: Shows real-time CPU load percentage
- 🕒 **Last Boot Time**: Displays the time and date of the last system boot
- 🔒 **LVM Support**: Indicates if Logical Volume Management (LVM) is in use
- 🌐 **Network Info**: Displays local IP and MAC addresses of the system
- 🔌 **Active TCP Connections**: Lists the number of established TCP connections
- 👤 **User Sessions**: Displays the number of users currently logged in
- 🛠️ **Sudo Commands**: Tracks and displays the number of sudo commands executed

## Prerequisites 📝

- A Debian-based operating system (Debian, Ubuntu, etc.)
- Bash shell

## Installation 🛠️

1. Clone the repository:
   ```bash
   git clone https://github.com/zajaddou/borninfo.git
   ```

2. Navigate to the directory:
   ```bash
   cd borninfo
   ```

3. Build the .deb package:
   ```bash
   dpkg-deb --build borninfo
   ```

4. Install the package:
   ```bash
   sudo dpkg -i borninfo.deb
   ```

## Usage 💡

BornInfo can be run with various options to display specific system information:

```bash
borninfo [OPTION]
```

### Available Options:

- `-a, --all`: Show all system information
- `-r, --architecture`: Show system architecture
- `-c, --cpu-physical`: Show the number of physical CPUs
- `-v, --vcpu`: Show the number of virtual CPUs
- `-m, --memory`: Show memory usage
- `-d, --disk`: Show disk usage
- `-l, --cpu-load`: Show CPU load percentage
- `-b, --last-boot`: Show the last boot time
- `--lvm`: Show if LVM is in use
- `-t, --tcp`: Show established TCP connections
- `-u, --user-log`: Show the number of logged-in users
- `-n, --network`: Show network information (IP and MAC)
- `-s, --sudo`: Show the number of sudo commands used
- `-h, --help`: Display help message

### Examples:

Display all system information:
```bash
borninfo -a
```

Show only memory usage:
```bash
borninfo -m
```

## Contributing 🤝

We welcome contributions to improve BornInfo! Here's how you can help:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License 📝

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact 📬

For questions or feedback, please:
- Open an issue on GitHub
- Contact: zajaddou@student.1337.ma

---

Made with ❤️ by zajaddou
