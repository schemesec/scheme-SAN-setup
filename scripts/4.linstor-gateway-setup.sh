#!/bin/bash
wget -O /usr/sbin/linstor-gateway https://github.com/LINBIT/linstor-gateway/releases/latest/download/linstor-gateway-linux-amd64
chmod +x /usr/sbin/linstor-gateway

apt -y install resource-agents targetcli-fb

cp /usr/share/doc/drbd-reactor/examples/drbd-reactor-reload.path /etc/systemd/system/
cp /usr/share/doc/drbd-reactor/examples/drbd-reactor-reload.service /etc/systemd/system/

systemctl enable --now drbd-reactor-reload.path


mkdir -p /etc/linstor
cp /root/schemelin/linstor_satellite.toml /etc/linstor/linstor_satellite.toml

systemctl restart linstor-satellite

#install linstor-gateway-service
cp /root/schemelin/linstor-gateway.service /etc/systemd/system/linstor-gateway.service

systemctl daemon-reload
systemctl enable --now linstor-gateway