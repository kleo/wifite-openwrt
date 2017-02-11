#!/bin/bash
#
# Installation script for Wifite for the WiFi Pineapple NANO + TETRA.
# 
# Written by: Kleo Bercero - kbeflo@gmail.com - https://github.com/kbeflo
# Many thanks for the help and guidance: Andreas Nilsen - adde88@gmail.com - https://www.github.com/adde88
#
# Starting wifite-ng install.
#
# Variables and colors
RED='\033[0;31m'
NC='\033[0m'
WIFITE="https://raw.githubusercontent.com/kbeflo/wifite-openwrt/master/wifite-ng"
#
echo -e "sdcard required"
echo -e "${RED}Installing: ${NC}Wifite"
echo -e "Go grab a cup of coffee, this can take a little while...\n"
# Download wifite-ng and remove python
cd /tmp
wget "$WIFITE"
opkg update
opkg remove python*
opkg remove python*
if [ -e /sd ]; then
	# Install python, reaver, and pixiewps to sd card
	opkg --dest sd install python reaver pixiewps
else
	# Tetra installation / general install.
	opkg install python reaver pixiewps
fi
# Cleanup
mv /tmp/wifite-ng /usr/sbin/wifite-ng
chmod +x /usr/sbin/wifite-ng
echo -e "Type 'wifite-ng' to launch Wifite"
exit 0

