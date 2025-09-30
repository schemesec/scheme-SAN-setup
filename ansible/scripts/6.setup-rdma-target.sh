#!/bin/bash



#linstor node-connection drbd-peer-options --transport tcp pvs1 pvs3
#linstor node-connection drbd-peer-options --transport tcp pvs2 pvs3
#linstor node-connection drbd-peer-options --transport rdma pvs1 pvs2


#linstor node set-property pvs3 AutoplaceTarget false

#initiate target
linstor-gateway nvme create schemesec:nvme:rg-pve0   192.168.20.51/24 3500G --resource-group pve_rg0

#linstor resource-connection drbd-peer-options --transport rdma pvs1 pvs2 rg-pve0



linstor resource-connection drbd-peer-options --sndbuf-size 10M --rcvbuf-size 10M --max-buffers 8096 pvs1 pvs2 rg-pve0


linstor-gateway nvme list   





#linstor-gateway nvme delete schemesec:nvme:rg-pve0 --force




#drbdadm new-current-uuid --clear-bitmap rg-pve0/0
#drbdadm new-current-uuid --clear-bitmap rg-pve0/1
#drbdadm new-current-uuid --clear-bitmap rg-pve0/2
#drbdadm new-current-uuid --clear-bitmap rg-pve0/3
#drbdadm new-current-uuid --clear-bitmap rg-pve0/4
#drbdadm new-current-uuid --clear-bitmap rg-pve0/5


















##old bullshit

#linstor node-connection drbd-peer-options --transport rdma pvs1 pvs2 
#linstor node-connection drbd-peer-options --transport tcp pvs1 pvs3
#linstor node-connection drbd-peer-options --transport tcp pvs2 pvs3

#linstor node-connection drbd-peer-options --sndbuf-size 10M --rcvbuf-size 10M --max-buffers 8096 pvs1 pvs2 