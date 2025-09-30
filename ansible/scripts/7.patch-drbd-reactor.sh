#!/bin/bash

#service to watch the drbd-reactorctl file and make sure that it is always set to rdma. Sometimes on primary to secondary handoff it will change

cp /root/schemelin/patch-promoter.path /etc/systemd/system/
cp /root/schemelin/patch-promoter.service /etc/systemd/system/



systemctl enable --now patch-promoter.path

