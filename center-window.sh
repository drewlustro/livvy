#!/bin/bash
# resizes the window to full height and 50% width and moves into upper right corner

#define the height in px of the top system-bar:
TOP_MARGIN=0
BOTTOM_MARGIN=0

#sum in px of all horizontal borders:
LEFTMARGIN=200

# get width of screen and height of screen
SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')

# new width and height
W=$(( $SCREEN_WIDTH / 2 + $LEFTMARGIN ))
H=$(( $SCREEN_HEIGHT - $BOTTOM_MARGIN * 2 ))

# X, change to move left or right:

# moving to the right half of the screen:
X=$(( $SCREEN_WIDTH / 2 - $W / 2 ))
# moving to the left:
#X=0;

Y=$TOP_MARGIN

wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && \
wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H &&
wmctrl -r :ACTIVE: -b add,maximized_vert
