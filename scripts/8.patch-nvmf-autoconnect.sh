#!/bin/bash

#installs service to patch nvmf-autoconnect.service for nvme clients. 
#This service can fail to connect to a nvme target as it doesn't wait long enough post boot.
#it simply pings the nvmet until it pings it successfully

cp /root/schemelin/patch-nvmf-autoconnect.service /etc/systemd/system/

systemctl enable --now patch-nvmf-autoconnect.service


