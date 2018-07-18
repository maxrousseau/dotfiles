#!/bin/bash

if [ -x /usr/bin/xfce4-power-manager ] ; then
	sleep 1
	xfce4-power-manager &
fi

feh --bg-fill Pictures/wallpaper003.jpg &

while true; do
	./dwm_status.sh 
done &

exec dwm
