
echo ""
echo "   ____                   _        __        "
echo "  | __ )  ___  _ __ _ __ (_)_ __  / _| ___   "
echo "  |  _ \ / _ \| '__| '_ \| | '_ \| |_ / _ \  "
echo "  | |_) | (_) | |  | | | | | | | |  _| (_) | "
echo "  |____/ \___/|_|  |_| |_|_|_| |_|_|  \___/  "
echo ""

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

for dep in "${dependencies[@]}"; do
    if ! dpkg-query -l "$dep" &> /dev/null; then
        echo "$dep is not installed. Installing..."
        apt-get install -y "$dep"
    fi
done

