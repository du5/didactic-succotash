#!/bin/bash

rm -rf ${0}

curl -sSL http://update.aegis.aliyun.com/download/quartz_uninstall.sh | bash

rm -rf /usr/local/aegis /usr/sbin/aliyun-service /lib/systemd/system/aliyun.service
