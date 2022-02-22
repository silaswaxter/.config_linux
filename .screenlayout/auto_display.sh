#!/bin/sh
# This script automatically determines what displays are
# connected and runs the appropiate display script
DISPLAY_SCRIPT_DIR="/home/silas/.screenlayout"

#Store xrandr connected output as an array
CONNECTED_DISPLAYS=$(xrandr | grep " connected ")
CONNECTED_DISPLAYS_ARR=(${CONNECTED_DISPLAYS})

#Parse through xrandr output and set the display flag accordingly
DISPLAY_FLAG="mobile"
for i in ${CONNECTED_DISPLAYS_ARR[@]}
do
	if [ $i = "HDMI-1" ]
	then
		DISPLAY_FLAG="desk"
	fi
done

#Check the display flag and execute appropriate script
echo "${DISPLAY_FLAG}"
if [ ${DISPLAY_FLAG} = "desk" ]
then
	echo "executing desktop screen layout script"
	exec ${DISPLAY_SCRIPT_DIR}/desk.sh
else
	echo "executing mobile screen layout script"
	exec ${DISPLAY_SCRIPT_DIR}/mobile.sh
fi
