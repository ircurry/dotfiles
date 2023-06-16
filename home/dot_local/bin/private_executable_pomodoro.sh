#!/bin/sh

work_timer() {
	SECONDS=0
	while [ ! $SECONDS = 1500 ]; do
		sleep 1
		SECONDS=$(($SECONDS + 1))
	done
	dunstify -u critical "Work Session Over" "Take a break" \
		 -h string:fgcolor:#a3be8caa \
		 -h string:bgcolor:#434c5eaa \
		 -h string:frcolor:#aaaaaa\
		 -i "alarm-symbolic" 
}

short_break_timer() {
	SECONDS=0
	while [ ! $SECONDS = 300 ]; do
		sleep 1
		SECONDS=$(($SECONDS + 1))
	done
	dunstify -u critical "Break is Over" "Get Back To Work!" \
		 -h string:fgcolor:#ebcb8baa \
		 -h string:bgcolor:#bf616aaa \
		 -h string:frcolor:#ebcb8b\
		 -i "alarm-symbolic" 
}

long_break_timer() {
	SECONDS=0
	while [ ! $SECONDS = 900 ]; do
		sleep 1
		SECONDS=$(($SECONDS + 1))
	done
	dunstify -u critical "Break is Over" "Get Back To Work!" \
		 -h string:fgcolor:#ebcb8baa \
		 -h string:bgcolor:#bf616aaa \
		 -h string:frcolor:#ebcb8b\
		 -i "alarm-symbolic" 
}

case $1 in
	w) work_timer ;;
	s) short_break_timer ;;
	l) long_break_timer ;;
	*) choice=$(echo "Work\nSmall Break\nLong Break\nExit" | fzf)
	   case $choice in
		   Work) setsid -f pomodoro.sh w >/dev/null 2>&1 ;;
		   "Small Break") setsid -f pomodoro.sh s >/dev/null 2>&1 ;;
		   "Long Break") setsid -f pomodoro.sh l >/dev/null 2>&1 ;;
		   Exit) exit 0 ;;
	   esac
esac
