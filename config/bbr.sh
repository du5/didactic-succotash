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

echo "* soft nofile 512000" >> /etc/security/limits.conf

echo "* hard nofile 512000" >> /etc/security/limits.conf

echo "root soft nofile 512000" >> /etc/security/limits.conf

echo "root hard nofile 512000"  >> /etc/security/limits.conf

cat /etc/security/limits.conf | grep nofile

echo 3 > /proc/sys/net/ipv4/tcp_fastopen

echo "" > /etc/sysctl.conf

echo "vm.vfs_cache_pressure = 50" >> /etc/sysctl.conf

echo "net.core.default_qdisc = cake" >> /etc/sysctl.conf

echo "net.ipv4.tcp_congestion_control = bbr" >> /etc/sysctl.conf

echo "net.ipv4.tcp_fastopen = 3" >> /etc/sysctl.conf

echo "net.core.rmem_default = 26214400" >> /etc/sysctl.conf

echo "net.core.rmem_max = 26214400" >> /etc/sysctl.conf

echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf

read -p "请按任意键重启，如需手动重启使用 Ctrl+C 退出。重启后需要执行 $0 2" var

reboot
