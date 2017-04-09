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
GREEN='\033[0;32m'
NC='\033[0m'
WIFITE="https://raw.githubusercontent.com/kbeflo/wifite-openwrt/master/wifite-ng"
#
echo -e ""
echo -e "Installing Wifite\n"
# Download wifite-ng and remove python
cd /tmp
wget "$WIFITE"
opkg update
opkg remove python*
opkg remove python*
if [ -e /sd ]; then
	# Install python, reaver, and pixiewps to sd card
	opkg --dest sd install python reaver pixiewps
	sed -i '183s/tmp/sd\/tmp/' /tmp/wifite-ng
	mkdir /sd/tmp
else
	# Tetra installation / general install.
	opkg install python reaver pixiewps
fi
# Cleanup
mv /tmp/wifite-ng /usr/sbin/wifite-ng
chmod +x /usr/sbin/wifite-ng
echo -e ""
echo -e "Installation finished\n"
echo -e "${GREEN}wifite-ng${NC} to launch Wifite"
echo -e "${GREEN}wifite-ng --help${NC} for more options\n"
exit 0
