#!/bin/sh
set -eu

dev=$1
dev_mtu=$2
link_mtu=$3
local_ip=$4
remote_ip=$5
init_restart=$6

echo "cmdline $*" >> var/up-down.log
set >> var/up-down.log
echo "up $local_ip $ifconfig_ipv6_local" > "var/$daemon_name.updown"

# echo 0 > /proc/sys/net/ipv4/conf/$dev/rp_filter

# Check if the interface is up and running (only prod)
if  ip link show tap7  > /dev/null 2>&1; then
    ip route add default via 100.71.128.1 dev tap7 table 20000
fi

