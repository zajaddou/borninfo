
# BornInfo - System Information Tool ![borninfo](https://img.shields.io/badge/BornInfo-Tool-blue)

**BornInfo** is a lightweight, fast, and user-friendly command-line utility that allows you to quickly gather critical information about your system. Whether you’re a developer, system administrator, or just an enthusiast, **BornInfo** makes it easier to monitor and manage your machine by providing instant access to vital system details like CPU, memory, disk usage, network configurations, and much more! 🚀

## Features 📋

- 🖥 **System Architecture**: Displays detailed system architecture info (e.g., kernel version, machine type).
- ⚙️ **CPU Information**: Shows the number of physical CPUs and virtual CPUs (vCPUs).
- 💾 **Memory Usage**: Displays total, used, and free memory statistics.
- 💻 **Disk Usage**: Provides the disk space usage with total, used, and available space details.
- 🏋️ **CPU Load**: Monitors and shows real-time CPU load percentage.
- 🕒 **Last Boot Time**: Displays the date and time of the last system boot.
- 🔒 **LVM Support**: Indicates if Logical Volume Management (LVM) is in use.
- 🌐 **Network Info**: Displays the system’s IP address and MAC address.
- 🔌 **Active TCP Connections**: Lists the number of active and established TCP connections.
- 👤 **User Sessions**: Displays the number of users currently logged into the system.
- 🛠 **Sudo Commands**: Tracks and displays the number of `sudo` commands executed.

## Installation 🛠️

### Prerequisites 📝

- A Linux-based operating system (Ubuntu, Debian, CentOS, Fedora, etc.)
- Bash shell (default on most systems)

### Installation via `.deb` Package 🚶‍♂️

The easiest way to install **BornInfo** is by using the `.deb` package.

1. **Download the `.deb` Package**:
   - Visit the [releases page](https://github.com/zajaddou/borninfo/releases) on GitHub to download the latest `.deb` package.

2. **Install the Package**:
   Once downloaded, install the package using the following command:

   ```bash
   sudo dpkg -i borninfo.deb
   ```

   This will install **BornInfo** on your system.

3. **Fix Dependencies** (if necessary):
   If you encounter dependency errors, you can resolve them with:

   ```bash
   sudo apt-get install -f
   ```

4. **Verify the Installation**:
   After installation, you can verify **BornInfo** by running:

   ```bash
   which borninfo
   ```

   This should return the location of the installed binary, typically `/usr/bin/borninfo`.

5. **Run the Tool**:
   Now you can run **BornInfo** from anywhere in your terminal:

   ```bash
   borninfo
   ```

### Alternative: Manual Installation 🚶‍♂️

If you prefer manual installation, you can also clone the repository and run the script directly.

1. **Clone the Repository**:

   ```bash
   git clone https://github.com/zajaddou/borninfo.git
   ```

2. **Make the Script Executable**:

   ```bash
   chmod +x borninfo.sh
   ```

3. **Move the Script to a Directory in Your `PATH`** (e.g., `/usr/local/bin`):

   ```bash
   sudo mv borninfo.sh /usr/local/bin/borninfo
   ```

4. **Run the Tool**:

   Now you can run **BornInfo** by simply typing:

   ```bash
   borninfo
   ```

## Usage 💡

### Options:

- `-a, --all`: Show all available system information.
- `-r, --architecture`: Show system architecture details.
- `-c, --cpu-physical`: Show the number of physical CPUs.
- `-v, --vcpu`: Show the number of virtual CPUs.
- `-m, --memory`: Show memory usage details.
- `-d, --disk`: Show disk usage statistics.
- `-l, --cpu-load`: Show the current CPU load percentage.
- `-b, --last-boot`: Show the time and date of the last system boot.
- `--lvm`: Show whether LVM (Logical Volume Management) is in use.
- `-t, --tcp`: Show active TCP connections.
- `-u, --user-log`: Show the number of users currently logged in.
- `-n, --network`: Show network information (IP address and MAC address).
- `-s, --sudo`: Show the number of sudo commands executed.
- `-h, --help`: Display help message.

### Example Usage:

To view all available system information:

```bash
borninfo -a
```

To display memory usage:

```bash
borninfo -m
```

## Contributing 🤝

We welcome contributions to improve **BornInfo**! If you'd like to help, please follow these steps:

1. Fork the repository on GitHub.
2. Create a new branch for your changes.
3. Commit your changes and push to your fork.
4. Submit a pull request.

Make sure your changes adhere to the project's coding standards and include relevant documentation or tests.

## License 📝

**BornInfo** is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.

## Contact 📬

For questions, feedback, or suggestions, please feel free to open an issue on the GitHub repository or contact us directly at [zajaddou@student.1337.ma].

---

Thank you for using **BornInfo**! We hope this tool makes managing and monitoring your system a breeze. 😊
