#!/bin/sh

if [ -d /sys/class/net/proton0 ];then 
	vpnip="$(ip addr show dev proton0 | grep 'inet ' | awk '{print $2}' | sed 's/\/[0-9]*//')"
	echo "vpnip|string|$vpnip"
	echo ""
else	
	echo "vpnip|string|none"
	echo ""
fi

