#!/bin/bash

# You need to copy files in place first before running this script

sudo update-grub
sudo reboot
sudo apt-get install qemu-kvm libvirt-bin openvswitch-switch-dpdk
dpdk-devbind --status
sudo systemctl daemon-reload
sudo systemctl enable dpdk.service
sudo systemctl start dpdk.service
sudo systemctl status dpdk.service
sudo systemctl disable irqbalance
sudo systemctl stop irqbalance
dpdk-devbind --status
sudo /etc/init.d/openvswitch-switch stop
sudo update-alternatives --set ovs-vswitchd /usr/lib/openvswitch-switch-dpdk/ovs-vswitchd-dpdk
sudo /etc/init.d/openvswitch-switch start
sudo chmod a+x /dev/vfio
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-socket-mem=1024,0
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:pmd-cpu-mask=0x100
sudo ovs-vsctl set Open_vSwitch . "other_config:dpdk-extra=--vhost-owner libvirt-qemu:kvm --vhost-perm 0666"
sudo /etc/init.d/openvswitch-switch restart
sudo ovs-vsctl add-br br-nznog -- set bridge br-nznog datapath_type=netdev
sudo ovs-vsctl set bridge br-nznog other-config:disable-in-band=true
sudo ovs-vsctl set-fail-mode br-nznog secure
sudo ovs-vsctl set-controller br-nznog tcp:192.168.122.2:6653 tcp:192.168.122.2:6654
sudo ovs-vsctl add-br br-nznog6 -- set bridge br-nznog6 datapath_type=netdev
sudo ovs-vsctl set bridge br-nznog6 other-config:disable-in-band=true
sudo ovs-vsctl set-fail-mode br-nznog6 secure
sudo ovs-vsctl set-controller br-nznog6 tcp:192.168.122.2:6653 tcp:192.168.122.2:6654
sudo ovs-vsctl show
