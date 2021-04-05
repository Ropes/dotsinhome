#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=(`ls --hide="launch.sh" $dir`)
style="forest"
monitor_search="DisplayPort-4"

second_monitor() {
    xrandr -q | grep " connected" | grep $monitor_search | cut -d ' ' -f1
}

launch_bar() {
	# Terminate already running bar instances
	killall -q polybar

	# Wait until the processes have been shut down
	while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    search_result=$(second_monitor);
    echo $search_result

	# Launch the bar
    if [[ $search_result = $monitor_search ]]; then
		polybar -q main -c "$dir/$style/config.ini" &	
		polybar -q second -c "$dir/$style/config.ini" &	
    else
        echo "no second monitor; using main"
		polybar -q main -c "$dir/$style/config.ini" &	
    fi
}

launch_bar
