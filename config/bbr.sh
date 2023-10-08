#!/bin/bash

# curl -s https://raw.githubusercontent.com/du5/didactic-succotash/master/config/bbr.sh | bash
rm -rf ${0}


sed -i '/soft nofile/d' /etc/security/limits.conf

sed -i '/hard nofile/d' /etc/security/limits.conf

echo "* soft nofile 1048576" >> /etc/security/limits.conf

echo "* hard nofile 1048576" >> /etc/security/limits.conf

echo "root soft nofile 1048576" >> /etc/security/limits.conf

echo "root hard nofile 1048576"  >> /etc/security/limits.conf

cat /etc/security/limits.conf | grep nofile

echo 3 > /proc/sys/net/ipv4/tcp_fastopen


cat <<EOF > /etc/sysctl.conf
net.core.default_qdisc = fq_pie
net.ipv4.tcp_congestion_control = bbr
net.ipv4.ip_forward = 1
dev.raid.speed_limit_max = 2000000
dev.raid.speed_limit_min = 1000000
EOF

sysctl -p
