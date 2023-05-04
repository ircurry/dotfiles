#! /bin/bash 

mem="$(free -h | awk '/^Mem:/ {print $3}')" 
echo -e "^C7^[ ^C5^$mem ^C7^]"
