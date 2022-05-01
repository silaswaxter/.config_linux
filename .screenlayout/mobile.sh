#!/bin/sh
# This script configures my displays for when its just my laptop display

# The ammount ot scale eDP-1 display
SCALE_FLOAT="1.0"

PACWALL_IMG="/home/silas/.cache/pacwall/pacwall.png"
PACWALL_SCALED_IMG="/home/silas/.cache/pacwall/pacwall_scaled.png"

# Configure each display
xrandr 	--output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal --scale ${SCALE_FLOAT}x${SCALE_FLOAT} \
	--output HDMI1 --off \
	--output HDMI2 --off \
	--output DP1 --off

# Set the Wallpaper
convert ${PACWALL_IMG} -scale ${SCALE_PERCENT}% ${PACWALL_SCALED_IMG} && \
feh 	--image-bg=#2e3440 \
	--bg-center $PACWALL_IMG \
       	--bg-center $PACWALL_SCALED_IMG &
