#!/bin/bash

apt-get update
apt-get dist-upgrade -y

apt install -y python3 python3-cffi python3-pyparsing git python-is-python3  python3-pip python3-setuptools libibverbs-dev


cd /root/schemelin/
#git clone git://git.infradead.org/users/hch/nvmetcli.git
cd nvmetcli/
python setup.py install


cp /root/schemelin/nvmet.conf /etc/modules-load.d/nvmet.conf 

cp /root/schemelin/mlx4.conf /etc/modprobe.d/mlx4.conf 


grep -Ev '^\s*(#|$)' /etc/modules-load.d/nvmet.conf | xargs -r -n1 modprobe


cp "/root/schemelin/$(uname -n)_interfaces" /etc/network/interfaces

ifreload -a

update-initramfs -u -k all
