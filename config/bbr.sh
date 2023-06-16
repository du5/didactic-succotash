#!/bin/bash

rm -rf ${0}

yum -y install bc

rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org

rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm

yum --enablerepo=elrepo-kernel install kernel-ml -y

egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'

echo "———————————————————————————————————"

read -p "请输入序号选择内核(第一项序号为 0, 默认选择 0 ):" kernel_id

[ -z "${kernel_id}" ] && kernel_id="0"

grub2-set-default ${kernel_id}

echo "———————————————————————————————————"

sed -i '/soft nofile/d' /etc/security/limits.conf

sed -i '/hard nofile/d' /etc/security/limits.conf

echo "* soft nofile 1048576" >> /etc/security/limits.conf

echo "* hard nofile 1048576" >> /etc/security/limits.conf

echo "root soft nofile 1048576" >> /etc/security/limits.conf

echo "root hard nofile 1048576"  >> /etc/security/limits.conf

cat /etc/security/limits.conf | grep nofile

echo 3 > /proc/sys/net/ipv4/tcp_fastopen

cat <<EOF > /etc/sysctl.conf
net.core.somaxconn = 4096
net.core.rmem_max = 26214400
net.core.default_qdisc = cake
net.core.rmem_default = 26214400

fs.file-max = 6553560
vm.vfs_cache_pressure = 50

net.ipv4.tcp_congestion_control = bbr
net.ipv4.tcp_fastopen = 3
net.ipv4.ip_forward = 1
net.ipv4.tcp_slow_start_after_idle = 0
net.ipv4.tcp_timestamps = 1
net.ipv4.tcp_tw_reuse = 1
net.ipv4.ip_local_port_range = 1024 65535
net.ipv4.tcp_max_syn_backlog = 4096
net.ipv4.tcp_abort_on_overflow = 1
EOF

read -p "请按任意键重启，如需手动重启使用 Ctrl+C 退出。重启后需要执行 $0 2" var

reboot
