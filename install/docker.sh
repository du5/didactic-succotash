#!/bin/bash

rm -rf ${0}

apt -y install curl || yum -y install curl libseccomp-devel

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

systemctl enable docker --now

curl -L "https://github.com/docker/compose/releases/download/1.28.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

docker-compose --version
