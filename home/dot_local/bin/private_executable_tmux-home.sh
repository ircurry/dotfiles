#!/bin/sh

htses="$(tmux ls 2> /dev/null | grep 'Hometag')"
if [ -z "$htses" ]; then
	tmux new -d -s "Hometag" "clear && bash"; 
	tmux new-window -t "Hometag" -n "calcurse" calcurse
	tmux new-window -t "Hometag" -n "pulsemixer" pulsemixer
	tmux new-window -t "Hometag" -n "top" btm
	tmux new-window -t "Hometag" -n "pompdoro" timer.sh
	tmux new-window -t "Hometag" -n "ncmpcpp" ncmpcpp
	tmux select-window -t "Hometag:calcurse"
	tmux attach -t Hometag
	#tmux new-window -d -s "Hometag" -n "Pulsemixer" pulsemixer >/dev/null 2>&1
	#tmux new -d -s "Hometag" -n "Top" btm >/dev/null 2>&1
	#tmux new -d -s "Hometag" -n "Pomodoro" timer.sh >/dev/null 2>&1
	#tmux new -d -s "Hometag" -n "ncmpcpp" ncmpcpp >/dev/null 2>&1
else
	tmux attach -t Hometag
fi
