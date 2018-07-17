#!/bin/bash

if [ -x /usr/bin/xfce4-power-manager ] ; then
	sleep 1
	xfce4-power-manager &
fi

while true; do
	./dwm_status.sh 
done &

exec dwm
