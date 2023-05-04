#!/bin/sh

# echo "[ $(ip addr | grep -E '[0-9]: wlan0' | awk '{print $9}') ]"
[ $(cat /sys/class/net/wlan0/operstate) = down ] && echo "^C7^[^c#808080^睊 ^C7^]" || echo "^C7^[^C3^直 ^C7^]"
