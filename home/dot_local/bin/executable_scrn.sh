#!/bin/bash

case $1 in
	-s) maim -u -s | tee $HOME/pix/ss/$(date +%Y%m%d-%s)-screenshot.png | xclip -sel clipboard -t image/png ;;
	*) maim -u | tee $HOME/pix/ss/$(date +%Y%m%d-%s)-screenshot.png | xclip -sel clipboard -t image/png ;;
esac
exit 0
