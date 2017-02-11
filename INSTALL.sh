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
echo -e "${RED}Installing: ${NC}Wifite"
echo -e "Go grab a cup of coffee, this can take a little while...\n"
# Download wifite-ng and remove python 
mkdir /sd/tmp
cd /sd/tmp
opkg update
opkg remove python*
opkg remove python*
wget "$WIFITE"
# Install python, reaver, and pixiewps to sd card. 
opkg --dest sd install python reaver pixiewps
# Cleanup
chmod +x /sd/tmp/wifite-ng
mkdir -p /sd/usr/share/wifite
mv wifite-ng /sd/usr/share/wifite/wifite-ng
ln -s /sd/usr/share/wifite/wifite-ng /usr/bin/wifite-ng
echo -e "\n"
echo -e "Type 'wifite-ng' to launch Wifite"
exit 0
