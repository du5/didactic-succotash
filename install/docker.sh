#!/bin/bash

rm -rf ${0}

apt -y install curl || yum -y install curl libseccomp-devel

curl -fsSL https://get.docker.com | bash 

systemctl enable docker --now

wget "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -O /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version
