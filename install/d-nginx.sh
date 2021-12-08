#!/bin/bash

rm -rf ${0}

apt install curl gnupg2 ca-certificates lsb-release -y

echo "deb http://nginx.org/packages/mainline/debian `lsb_release -cs` nginx" | sudo tee /etc/apt/sources.list.d/nginx.list

curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

apt-key fingerprint ABF5BD827BD9BF62

apt -y update
apt -y install nginx
