#!/bin/bash

rm -rf ${0}

public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrxtljQyiUxpXCj68Q4oCFCqCJ5s1fa170bVs++XIMY+vUq72v4W+Mh5nCrhCMIb94QtTVISXy13LK/4EmBvIX2GcVFdKgFEe+JGlK4N00ytoaZCS7jaTdkUUhDE4f6qWyjtnZHGX+irwJjynwwucpjUc7LPiCb25RaMrJFU5bfwP/lmOLFj9tbXUNKkdyRjqOafeYQ1nW4jJ2Ggoqm/VK+l1yqIkfOsvTmkS+z/13pyCfnU1UkIMYsujvKA6VsfResidvG3Lz3mUa0KVbZxH0kkgGKjkqBbJrhcKwJzGTIkInLiSFhDwBM7Cw+yE4jpkN2U46sa3ENSDHINz4cgQJ cardno:000617939714"

mkdir -p /root/.ssh
echo "${public_key}" > /root/.ssh/authorized_keys
chmod 700 /root/.ssh
chmod 644 /root/.ssh/authorized_keys

sed -i "s|PermitRootLogin |#PermitRootLogin |" /etc/ssh/sshd_config
sed -i "s|PasswordAuthentication |#PasswordAuthentication |" /etc/ssh/sshd_config
sed -i "s|PubkeyAuthentication |#PubkeyAuthentication |" /etc/ssh/sshd_config

echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

echo "vm.swappiness = 25" >> /etc/sysctl.conf

sysctl -w vm.swappiness=25

systemctl restart sshd
