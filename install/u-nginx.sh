#!/bin/bash

apt -y install curl gnupg2 ca-certificates lsb-release

echo "deb http://nginx.org/packages/mainline/ubuntu `lsb_release -cs` nginx" \
    | sudo tee /etc/apt/sources.list.d/nginx.list

curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -

apt-key fingerprint ABF5BD827BD9BF62

apt -y update

apt -y install nginx