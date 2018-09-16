#!/usr/bin/bash

#make clean
find files -name *~ -exec rm '{}' \;

make image PROFILE=bt_homehub-v5a FILES=files/ PACKAGES="\
libiwinfo \
libiwinfo-lua \
liblua \
liblucihttp \
liblucihttp-lua \
libubus-lua \
lua \
luci \
luci-app-firewall \
luci-base \
luci-lib-ip \
luci-lib-jsonc \
luci-lib-nixio \
luci-mod-admin-full \
luci-proto-ipv6 \
luci-proto-ppp \
luci-theme-bootstrap \
rpcd \
rpcd-mod-rrdns \
uhttpd \
ca-bundle \
ca-certificates \
stubby \
uclient-fetch \
libuclient \
libustream-openssl \
adblock \
luci-app-adblock \
-dnsmasq \
dnsmasq-full \
"
