#!/bin/sh

con=0
while [ $con = 0 ]; do
      choice=$(echo "Work\nSmall Break\nLong Break\nExit" | fzf)
      case $choice in 
	      Work) termdown 25m -t "Take A Break" ;;
	      "Small Break") termdown 5m -t "Break is Over!";;
	      "Long Break") termdown 15m -t "Break is Over!";;
	      Exit) con=$(($con+1))
      esac
done
