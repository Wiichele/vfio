#!/bin/bash
set -x

systemctl stop gdm.service
sleep 1
systemctl isolate multi-user.target
sleep 1

echo 0 > /sys/class/vtconsole/vtcon0/bind
echo 0 > /sys/class/vtconsole/vtcon1/bind
sleep 3

modprobe -r amdgpu
modprobe -r --remove-dependencies drm
sleep 2

virsh nodedev-detach --device pci_0000_09_00_0
virsh nodedev-detach --device pci_0000_09_00_1
sleep 1

rtcwake -m mem -s 5
sleep 3
