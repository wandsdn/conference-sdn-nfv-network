#!/bin/bash

# You need to copy files in place first before running this script

sudo systemctl disable systemd-resolved.service 
sudo systemctl stop systemd-resolved.service
sudo apt-get install python-pip python-dev bird unbound isc-dhcp-server
sudo pip install ryu-faucet
wget https://grafanarel.s3.amazonaws.com/builds/grafana_4.0.2-1481203731_amd64.deb
wget https://dl.influxdata.com/influxdb/releases/influxdb_1.1.1_amd64.deb
sudo dpkg -i influxdb_1.1.1_amd64.deb
sudo dpkg -i grafana_4.0.2-1481203731_amd64.deb
sudo systemctl daemon-reload
sudo systemctl enable isc-dhcp-server6
sudo systemctl start isc-dhcp-server6
sudo systemctl enable faucet
sudo systemctl start faucet
sudo systemctl enable gauge
sudo systemctl start gauge
sudo systemctl start influxdb
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

# There is some further manual setup for influxdb/grafana
# You must manually create a 'faucet' DB for influxdb
# You must manually import the grafana dashboard definition
