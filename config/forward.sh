#!/bin/bash

# bash config/forward.sh 23 65535 1.1.1.1

StartPort=${1}

EndPort=${2}

ToIP=${3}

iptables -t nat -I PREROUTING -p tcp --dport ${StartPort}:${EndPort} -j DNAT --to ${ToIP}

iptables -t nat -I PREROUTING -p udp --dport ${StartPort}:${EndPort} -j DNAT --to ${ToIP}

iptables -t nat -I POSTROUTING -p tcp --dport ${StartPort}:${EndPort} -j MASQUERADE

iptables -t nat -I POSTROUTING -p udp --dport ${StartPort}:${EndPort} -j MASQUERADE

service iptables save