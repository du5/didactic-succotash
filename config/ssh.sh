#!/bin/bash

rm -rf ${0}

public_key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEjZT6gUxxswzntTt+7MHyJVyFe8bL2AOcEC4UkmLtaRiwtuHvqCnl+//oUpBcH7zCF7gAzHoqQ10FezeKB71wGiRlapXBJej6OgwdeeM96fO6rNPeV360PRRqRkb0Iyp3RNuh1cNSO1euccQSEm18bE6zUmM2OyLYgaARpg5y5GV87uPQFOgzcUOw0KCycyoeh7voQcNDScaZdq53TUzr46lg6W0oWMPtodzRr1pwdHAmbTCC1hu2WPq5A3TJ8AmiKNaTHkJQ+dHLUcfZXj84l61MhqzTFiR5jso6FlQqPrmJT+kv2TyH93d0CfytUfsxyS2A1qulQZJuG29q2/Wt root"

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

systemctl restart sshd