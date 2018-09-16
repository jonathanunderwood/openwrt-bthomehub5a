#!/bin/sh

STUBBY_CFG=/etc/stubby/stubby.yml

if ! grep -q appdata_dir "$STUBBY_CFG" ; then
    echo 'appdata_dir: "/tmp/stubby"' >> "$STUBBY_CFG"
fi

if ! grep -q dnssec_return_status "$STUBBY_CFG" ; then
    echo 'dnssec_return_status: GETDNS_EXTENSION_TRUE' >> "$STUBBY_CFG"
fi
