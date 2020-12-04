#!/bin/bash

rm -rf ${0}

dd if=/dev/zero of=/mnt/swap bs=1M count=`awk '($1 == "MemTotal:"){print int($2/1024*2)}' /proc/meminfo`

chmod 600 /mnt/swap

mkswap /mnt/swap

swapon /mnt/swap

echo "/mnt/swap swap swap defaults 0 0" >> /etc/fstab

echo "vm.swappiness = 25" >> /etc/sysctl.conf

sysctl -w vm.swappiness=25

free -h