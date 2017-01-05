#!/bin/bash

# You need to copy files in place first before running this script

sudo apt-get install iperf3
sudo systemctl daemon-reload
sudo systemctl enable iperf3
sudo systemctl start iperf3