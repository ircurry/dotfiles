#!/bin/sh

[ -d /sys/class/net/proton0 ] && echo "^C7^[^C6^ $(ip addr show dev proton0 | grep "inet " | awk '{print $2}' | sed 's/\/[0-9]*//') ^C7^]"
