#!/bin/sh

bin_dir="$HOME/.local/bin/"
find "$bin_dir" | while read line; do 
	if [ -f "$line" ]; then
		if [ "$(stat -c %a "$line")" != "744" ] ; then
			chmod 744 "$line"
		fi
	fi
done
