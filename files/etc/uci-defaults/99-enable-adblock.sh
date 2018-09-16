#!/bin/sh

[ -f /sysupgrade.tgz ] && exit 0

(crontab -l 2>/dev/null; echo "*/5 * * * * /path/to/job -with args") | crontab -

uci -q batch <<-EOF
set adblock.global.adb_enabled=1
EOF
