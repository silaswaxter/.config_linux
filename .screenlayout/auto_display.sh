#!/bin/sh
# This script automatically determines what displays are
# connected and runs the appropriate display script
DISPLAY_SCRIPT_DIR="/home/silas/.screenlayout"

# ammount to scale mobile monitor
MOBILE_SCALE="0.8"

# store xrandr connected output as an array
XRANDR_CONNECTED=$(xrandr | grep " connected ")
XRANDR_CONNECTED=(${XRANDR_CONNECTED})

# parse through xrandr output and set the display flag accordingly
DISPLAY_FLAG="mobile"
for i in ${XRANDR_CONNECTED[@]}
do
    if [[ $i == *"HDMI"* ]]; then
        DISPLAY_FLAG="desk"
    fi
done

# check the display flag and execute appropriate script
case ${DISPLAY_FLAG} in
    "mobile")
        echo "screen layout script executed:    mobile"
        echo "scaling mobile by:                1x1"
        xrandr --output eDP-1 --scale 1x1
        ;;
    "desk")
        echo "screen layout script executed:    desk"
        ${DISPLAY_SCRIPT_DIR}/desk.sh
        echo "scaling mobile by:                ${MOBILE_SCALE}x${MOBILE_SCALE}"
        xrandr --output eDP-1 --scale ${MOBILE_SCALE}x${MOBILE_SCALE}
        ;;
    *)
        echo "screen layout script executed:    NONE"
        ;;
esac

# refresh background
exec pacwall
