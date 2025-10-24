#!/bin/bash
wget -O /tmp/linbit-keyring.deb https://packages.linbit.com/public/linbit-keyring.deb
dpkg -i /tmp/linbit-keyring.deb
PVERS=9 && echo "deb [signed-by=/etc/apt/trusted.gpg.d/linbit-keyring.gpg] http://packages.linbit.com/public/ proxmox-$PVERS drbd-9" > /etc/apt/sources.list.d/linbit.list

apt update

apt -y install drbd-dkms drbd-utils drbd-reactor proxmox-default-headers linstor-proxmox linstor-controller linstor-satellite linstor-client vim

systemctl disable --now linstor-controller
cp /root/schemelin/linstor-client.conf /etc/linstor/linstor-client.conf
mkdir -p /etc/systemd/system/linstor-satellite.service.d

cp /root/schemelin/override.conf /etc/systemd/system/linstor-satellite.service.d/override.conf

ifreload -a
