#!/bin/bash

rm -rf ${0}

systemctl stop firewalld.service && systemctl disable firewalld.service && systemctl mask firewalld.service

yum install initscripts iptables iptables-services -y

systemctl enable iptables.service --now

iptables -F && iptables -X && iptables -Z && iptables -t nat -F && iptables -P INPUT ACCEPT && iptables -P FORWARD ACCEPT && iptables -P OUTPUT ACCEPT

service iptables save