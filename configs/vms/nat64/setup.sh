#!/bin/bash

# You need to copy files in place first before running this script

sudo systemctl disable systemd-resolved.service 
sudo systemctl stop systemd-resolved.service
sudo apt-get install isc-dhcp-server unbound
sudo apt-get install dkms unzip build-essential linux-headers-$(uname -r)
sudo sysctl -p /etc/sysctl.d/20-routing.conf
sudo systemctl disable isc-dhcp-server
sudo systemctl stop isc-dhcp-server
sudo systemctl enable isc-dhcp-server6
sudo systemctl start isc-dhcp-server6
wget https://github.com/NICMx/releases/raw/master/Jool/Jool-3.5.2.zip
unzip Jool-3.5.2.zip
dkms install Jool-3.5.2
sudo reboot
