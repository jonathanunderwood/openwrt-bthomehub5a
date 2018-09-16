#!/bin/sh

STUBBY_CFG=/etc/stubby/stubby.yml
SYSUPGRADE_CFG=/etc/sysupgrade.conf

if ! grep -q "$STUBBY_CFG" "$SYSUPGRADE_CFG" ; then
    echo "$STUBBY_CFG" >> "$SYSUPGRADE_CFG"
fi
