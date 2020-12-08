#!/bin/bash
rm -rf ${0} /home/tc.sh

sed -i '/bash \/home\/tc.sh/d'  /etc/rc.local

sed -i '$i '"bash /home/tc.sh"'' /etc/rc.local

touch /home/tc.sh

echo -e "#!/bin/bash " > /home/tc.sh
echo -e "tc qdisc del dev eth0 root 2>/dev/null
tc qdisc add dev eth0 root handle 1:0 htb default 1
tc class add dev eth0 parent 1:0 classid 1:1 htb rate 10Mbit ceil 10Mbit prio 0
tc class add dev eth0 parent 1:1 classid 1:2 htb rate 6Mbit ceil 6Mbit prio 1 burst 4Mbit
tc qdisc add dev eth0 parent 1:2 handle 111:0 sfq perturb 10
tc filter add dev eth0 parent 1:0 protocol ip prio 1 handle 1 fw classid 1:2
iptables -t mangle -F
iptables -t mangle -A POSTROUTING -p tcp -d 0.0.0.0/5 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 8.0.0.0/7 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 11.0.0.0/8 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 12.0.0.0/6 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 16.0.0.0/4 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 32.0.0.0/3 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 64.0.0.0/2 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 128.0.0.0/3 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 160.0.0.0/5 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 168.0.0.0/6 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 172.0.0.0/12 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 172.32.0.0/11 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 172.64.0.0/10 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 172.128.0.0/9 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 173.0.0.0/8 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 174.0.0.0/7 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 176.0.0.0/4 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 192.0.0.0/9 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 192.128.0.0/11 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 192.160.0.0/13 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 192.169.0.0/16 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 192.170.0.0/15 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 192.172.0.0/14 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 192.176.0.0/12 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 192.192.0.0/10 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 193.0.0.0/8 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 194.0.0.0/7 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 196.0.0.0/6 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 200.0.0.0/5 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 208.0.0.0/4 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p tcp -d 224.0.0.0/3 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 0.0.0.0/5 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 8.0.0.0/7 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 11.0.0.0/8 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 12.0.0.0/6 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 16.0.0.0/4 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 32.0.0.0/3 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 64.0.0.0/2 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 128.0.0.0/3 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 160.0.0.0/5 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 168.0.0.0/6 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 172.0.0.0/12 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 172.32.0.0/11 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 172.64.0.0/10 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 172.128.0.0/9 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 173.0.0.0/8 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 174.0.0.0/7 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 176.0.0.0/4 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 192.0.0.0/9 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 192.128.0.0/11 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 192.160.0.0/13 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 192.169.0.0/16 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 192.170.0.0/15 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 192.172.0.0/14 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 192.176.0.0/12 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 192.192.0.0/10 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 193.0.0.0/8 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 194.0.0.0/7 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 196.0.0.0/6 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 200.0.0.0/5 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 208.0.0.0/4 -o eth0 -j MARK --set-mark 1
iptables -t mangle -A POSTROUTING -p udp -d 224.0.0.0/3 -o eth0 -j MARK --set-mark 1
service iptables save
" >> /home/tc.sh

bash /home/tc.sh