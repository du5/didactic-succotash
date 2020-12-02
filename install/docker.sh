#!/bin/bash

apt -y install curl || yum -y install curl

curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

systemctl enable docker --now