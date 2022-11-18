#!/bin/bash
set -euxo pipefail

systemctl stop zdhcpd.service
systemctl disable zdhcpd.service
install -o root -g root -m 700 zdhcpd /usr/local/sbin/zdhcpd
install -o root -g root -m 644 zdhcpd.service /lib/systemd/system/zdhcpd.service
install -o root -g root -m 644 zdhcpd.logrotate /etc/logrotate.d/zdhcpd
install -o root -g root -m 700 check-arp-entries /usr/local/sbin/check-arp-entries
systemctl daemon-reload
systemctl start zdhcpd.service
systemctl enable zdhcpd.service
