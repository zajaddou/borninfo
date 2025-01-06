
export DEBIAN_FRONTEND=noninteractive

if [ "$(id -u)" -ne 0 ]; then
    echo " This script must be run as root (with sudo)."
    exit 1
fi

vrsion=$(cat package/DEBIAN/control | grep Version | awk '{print $2}')

echo ""
echo "  ____   v:$vrsion         _        __        "
echo " | __ )  ___  _ __ _ __ (_)_ __  / _| ___   "
echo " |  _ \ / _ \| '__| '_ \| | '_ \| |_ / _ \  "
echo " | |_) | (_) | |  | | | | | | | |  _| (_) | "
echo " |____/ \___/|_|  |_| |_|_|_| |_|_|  \___/  "

echo -e "\n"

pwd=$(pwd)

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

echo -e " + System Update \n"
sleep 0.2

apt-get install update -y > /dev/null 2>&1
apt-get install upgrade -y > /dev/null 2>&1

echo " + Checking Dependencies..."

for dep in "${dependencies[@]}"; do
    if ! dpkg-query -W -f='${Status}' "$dep" 2>/dev/null | grep -q "install ok installed"; then
        echo " + Install $dep "
        apt-get install -y "$dep" > /dev/null 2>&1
        if [ $? -ne 0 ]; then
            echo " -  Failed to install $dep. Please check manually."
            exit 0
        fi
    fi
done


echo  " + Add Permissions "
sleep 0.2

chmod 755 package/DEBIAN/postinst

echo -e " + Compileing \n "

dpkg-deb --build package > /dev/null 2>&1
dpkg -i package.deb > /dev/null 2>&1

rm -rf package.deb

echo " * Installation complete :) "
echo ""