#!/bin/bash

systemctl enable --now linstor-controller
apt install linstor-gui -y
systemctl enable --now linstor-gui

linstor node create pvs1 192.168.20.50 --node-type Combined
linstor node create pvs2 192.168.20.55 --node-type Combined
linstor node create pvs3 192.168.30.65

#pvs1 disk setup
linstor physical-storage create-device-pool   --pool-name nvme_pool   --storage-pool linstor_lvm   lvm pvs1   /dev/disk/by-id/nvme-SAMSUNG_MZ1LB1T9HALS-00007_S436NC0R433740  /dev/disk/by-id/nvme-SAMSUNG_MZ1LB1T9HALS-00007_S436NA0NB00971

linstor storage-pool set-property pvs1 linstor_lvm StorDriver/LvcreateOptions "-i2 -I64"

#pvs2 disk setup
linstor physical-storage create-device-pool   --pool-name nvme_pool   --storage-pool linstor_lvm   lvm pvs2   /dev/disk/by-id/nvme-SAMSUNG_MZ1LB1T9HALS-00007_S436NC0R528352   /dev/disk/by-id/nvme-SAMSUNG_MZ1LB1T9HALS-00007_S436NC0R434089

linstor storage-pool set-property pvs2 linstor_lvm StorDriver/LvcreateOptions "-i2 -I64"

#create rg
linstor resource-group create pve_rg0 --storage-pool linstor_lvm --place-count 2
#set replication type
linstor resource-group drbd-options --protocol C pve_rg0 
