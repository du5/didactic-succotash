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

tcp_mem="$(awk '($1 == "MemTotal:"){print int($2/64)}' /proc/meminfo) $(awk '($1 == "MemTotal:"){print int($2/32)}' /proc/meminfo) $(awk '($1 == "MemTotal:"){print int($2/16)}' /proc/meminfo)"

cat <<EOF > /etc/sysctl.conf

# bbr 
net.core.default_qdisc = fq_pie
net.ipv4.tcp_congestion_control = bbr

net.core.somaxconn = 4096
fs.file-max = 1048576

# swap 
vm.swappiness = 10
vm.vfs_cache_pressure = 50

# raid 2g/1g
dev.raid.speed_limit_max = 2000000
dev.raid.speed_limit_min = 1000000


# tcp 

net.ipv4.tcp_fastopen = 3
net.ipv4.ip_forward = 1
net.ipv4.tcp_slow_start_after_idle = 0
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65535
net.ipv4.tcp_max_syn_backlog = 4096
net.ipv4.tcp_abort_on_overflow = 1

net.ipv4.tcp_rmem = $tcp_mem
net.ipv4.tcp_wmem = $tcp_mem
EOF

sysctl -p
