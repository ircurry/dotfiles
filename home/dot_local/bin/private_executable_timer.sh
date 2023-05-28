#!/bin/sh

con=0
while [ $con = 0 ]; do
      choice=$(echo "Work\nSmall Break\nLong Break\nExit" | fzf)
      case $choice in 
	      Work) termdown 25m 
		             mpv --no-video "$XDG_DATA_HOME/audio/alarm-sounds/hotel-service-bell.mp3" >/dev/null 2>&1 &
		             termdown -T "Take A Break";;
	      "Small Break") termdown 5m
			     mpv --no-video "$XDG_DATA_HOME/audio/alarm-sounds/analog-alarm-clock.mp3" >/dev/null 2>&1 &
			     termdown -T "Break is Over!";;
	      "Long Break") termdown 15m
			     mpv --no-video "$XDG_DATA_HOME/audio/alarm-sounds/analog-alarm-clock.mp3" >/dev/null 2>&1 &
			     termdown -T "Break is Over!";;
	      Exit) con=$(($con+1))
      esac
done
