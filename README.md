```javascript
mkdir .ssh
vi .ssh/authorized_keys
sudo vi /etc/network/interfaces
sudo vi /etc/ssh/sshd_config
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo reboot
sudo netstat -lnp
sudo apt-get install htop tcpdump vim git docker.io aufs-tools
sudo apt-get install openvswitch-switch-dpdk
sudo ovs-vsctl show
dpdk-devbind --status
cat /proc/cmdline | grep iommu=pt
cat /proc/cmdline | grep intel_iommu=on
dmesg | grep -e DMAR -e IOMMU
sudo cp configs/etc/default/grub /etc/default/grub
sudo update-grub
sudo cat configs/etc/fstab >> /etc/fstab
sudo reboot
cat /proc/cmdline | grep iommu=pt
cat /proc/cmdline | grep intel_iommu=on
cat /usr/share/doc/openvswitch-switch-dpdk/README.Debian
cat /usr/share/doc/dpdk/changelog.Debian.gz
sudo cp scripts/remap-dpdk-interfaces /usr/local/bin/remap-dpdk-interfaces
sudo cp configs/etc/systemd/system/dpdk.service /etc/systemd/system/dpdk.service
sudo cp -r configs/etc/systemd/system/openvswitch-nonetwork.service.d/ /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable dpdk.service
sudo systemctl start dpdk.service
sudo systemctl status dpdk.service
dpdk-devbind --status
sudo docker pull faucet/faucet:v1_2_1
sudo docker pull faucet/gauge:v1_2_1
sudo /usr/bin/chmod a+x /dev/vfio
sudo ovs-vsctl --no-wait set Open_vSwitch . other_config:dpdk-init=true
sudo ovs-vsctl add-br br-nznog -- set bridge br-nznog datapath_type=netdev
sudo ovs-vsctl show
sudo /etc/init.d/openvswitch-switch stop
cat /usr/share/doc/openvswitch-switch-dpdk/README.Debian
sudo update-alternatives --set ovs-vswitchd         /usr/lib/openvswitch-switch-dpdk/ovs-vswitchd-dpdk
sudo /etc/init.d/openvswitch-switch start
sudo ovs-vsctl set Open_vSwitch .     "other_config:dpdk-extra=--vhost-owner libvirt-qemu:kvm --vhost-perm 0666"
sudo less /var/log/syslog
for i in `seq 0 15`; do sudo ovs-vsctl add-port br-nznog dpdk$i -- set Interface dpdk$i type=dpdk; done
sudo ovs-vsctl show
sudo mkdir -p /etc/ryu/faucet
sudo mkdir -p /var/log/ryu/faucet
sudo vi /usr/local/bin/boot-faucet
sudo chmod +x /usr/local/bin/boot-faucet
sudo /usr/local/bin/boot-faucet
sudo docker ps
sudo vi /etc/ryu/faucet/faucet.yaml
sudo vi /etc/ryu/faucet/gauge.yaml
ovs-ofctl -OOpenFlow13 dump-ports br-nznog
sudo ovs-ofctl -OOpenFlow13 dump-ports br-nznog
sudo ovs-ofctl -OOpenFlow13 dump-ports-desc br-nznog
sudo ovs-ofctl -OOpenFlow13 show br-nznog
sudo docker logs faucet
sudo ovs-vsctl set-controller br-nznog tcp:127.0.0.1:6653 tcp:127.0.0.1:6654
sudo ovs-vsctl set-fail-mode br-nznog secure
sudo ovs-vsctl set bridge br-nznog other-config:disable-in-band=true
sudo ovs-vsctl show
sudo ovs-ofctl dump-flows br-nznog
less /var/log/ryu/faucet/faucet.log
ovs-appctl dpif-netdev/pmd-stats-show
sudo ovs-appctl dpif-netdev/pmd-stats-show
```
