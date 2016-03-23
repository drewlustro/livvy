#!/bin/bash

TARGET_APP="$1";

# Unshade and bring to front
if [ -f "/tmp/.$TARGET_APP.shaded" ]; then
    wmctrl -x -r "$TARGET_APP" -b remove,below
    wmctrl -x -r "$TARGET_APP" -b remove,shaded
    wmctrl -x -a "$TARGET_APP"
    rm "/tmp/.$TARGET_APP.shaded" 2> /dev/null
# Shade and send to back
else
    # wmctrl -r 'Google Chrome' -b add,shaded
    wmctrl -x -r "$TARGET_APP" -b add,below
    xdotool getactivewindow windowfocus
    touch "/tmp/.$TARGET_APP.shaded" 2> /dev/null
fi
