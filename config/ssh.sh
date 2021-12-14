#!/bin/bash

rm -rf ${0}

mkdir -p /root/.ssh
chmod 700 /root/.ssh
cat <<EOF > /root/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrxtljQyiUxpXCj68Q4oCFCqCJ5s1fa170bVs++XIMY+vUq72v4W+Mh5nCrhCMIb94QtTVISXy13LK/4EmBvIX2GcVFdKgFEe+JGlK4N00ytoaZCS7jaTdkUUhDE4f6qWyjtnZHGX+irwJjynwwucpjUc7LPiCb25RaMrJFU5bfwP/lmOLFj9tbXUNKkdyRjqOafeYQ1nW4jJ2Ggoqm/VK+l1yqIkfOsvTmkS+z/13pyCfnU1UkIMYsujvKA6VsfResidvG3Lz3mUa0KVbZxH0kkgGKjkqBbJrhcKwJzGTIkInLiSFhDwBM7Cw+yE4jpkN2U46sa3ENSDHINz4cgQJ cardno:000617939714

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEjZT6gUxxswzntTt+7MHyJVyFe8bL2AOcEC4UkmLtaRiwtuHvqCnl+//oUpBcH7zCF7gAzHoqQ10FezeKB71wGiRlapXBJej6OgwdeeM96fO6rNPeV360PRRqRkb0Iyp3RNuh1cNSO1euccQSEm18bE6zUmM2OyLYgaARpg5y5GV87uPQFOgzcUOw0KCycyoeh7voQcNDScaZdq53TUzr46lg6W0oWMPtodzRr1pwdHAmbTCC1hu2WPq5A3TJ8AmiKNaTHkJQ+dHLUcfZXj84l61MhqzTFiR5jso6FlQqPrmJT+kv2TyH93d0CfytUfsxyS2A1qulQZJuG29q2/Wt root
EOF

chmod 644 /root/.ssh/authorized_keys

sed -i '/PermitRootLogin /d' /etc/ssh/sshd_config
sed -i '/PasswordAuthentication /d' /etc/ssh/sshd_config
sed -i '/PubkeyAuthentication /d' /etc/ssh/sshd_config
sed -i '/Port 22/d' /etc/ssh/sshd_config

echo "Port 223" >> /etc/ssh/sshd_config
echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config
echo "PasswordAuthentication no" >> /etc/ssh/sshd_config

systemctl restart sshd
