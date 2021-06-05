#!/bin/bash
set -x

virsh nodedev-reattach --device pci_0000_09_00_0
virsh nodedev-reattach --device pci_0000_09_00_1
sleep 5

modprobe amdgpu
sleep 2

#rtcwake -m mem -s 5
#sleep 3

systemctl start gdm.service
