#!/bin/sh

# Exit without any changes if we're restoring a saved config. Note
# that, if restoring a saved config during a flash, this file will be
# saved and applied during preinit, but is not deleted until the end
# of the normal init (in the "done" script.
[ -f /sysupgrade.tgz ] && exit 0

# Stubby listens on port 5453, so we need to tell dnsmasq to use
# 127.0.0.1:5453 as the upstream resolver.  We also need to configure
# the wan interface to not use the ISP provided name server, but
# rather use the local nameserver provided by dnsmasq at 127.0.0.1.
# Also set dnsmasq to require DNSSEC validation.
# Note: commit not needed here, as the uci-defaults script runs a
# commit after each script
uci -q batch <<-EOF
add_list dhcp.@dnsmasq[-1].server='127.0.0.1#5453'
set dhcp.@dnsmasq[-1].dnssec=1
set dhcp.@dnsmasq[-1].noresolv=1
set dhcp.@dnsmasq[-1].dnssec=1
set dhcp.@dnsmasq[-1].dnsseccheckunsigned=1
set network.wan.peerdns='0'
set network.wan.dns='127.0.0.1'
EOF
