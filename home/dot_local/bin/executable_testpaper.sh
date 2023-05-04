#!/bin/sh

ppr="$(find $HOME/pix/wall/ | fzf)"
#echo "$(feh --no-fehbg --bg-max $ppr && wal -n -i $ppr)"
echo "$(feh --no-fehbg --bg-fill $ppr && wal -n -i $ppr)"
