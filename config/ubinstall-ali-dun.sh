#!/bin/bash

# curl -s https://raw.githubusercontent.com/du5/didactic-succotash/master/config/ubinstall-ali-dun.sh | bash 

rm -rf ${0}

curl -sSL http://update.aegis.aliyun.com/download/quartz_uninstall.sh | bash

rm -rf /usr/local/aegis 

systemctl disable --now aliyun.service

/usr/local/share/assist-daemon/assist_daemon --stop

/usr/local/share/assist-daemon/assist_daemon --delete

rm -rf /usr/local/share/assist-daemon
