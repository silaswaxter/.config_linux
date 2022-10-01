#!/bin/bash
################################################################################
# ABOUT:  This script is responsible for determining which displays are
#         connected and calling the respective script. 
################################################################################
# prints a space-separated list of the xrandr outputs that are connected.
get_connected_xrandr_outputs () {
  # read each line in command output.
  xrandr | grep " connected " | while read line; do
    printf " $(echo ${line} | awk '{print $1;}')"
  done
  printf "\n"
}

connected_outputs=$(get_connected_xrandr_outputs)

# Not using quotes around variable because loop iterates on each element
# separated by a space. Quoting groups elements into single element that
# contains spaces.
for output in ${connected_outputs}; do
  echo "${output}"
done

if [[ "${connected_outputs}" == *"HDMI-1"* ]]; then
  echo "Configuring displays for desk."
  /home/$(whoami)/.screenlayout/desk.sh
else
  echo "Configuring displays for mobile."
  /home/$(whoami)/.screenlayout/mobile.sh
fi
