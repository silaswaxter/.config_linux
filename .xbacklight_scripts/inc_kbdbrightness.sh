#!/bin/bash
CUR_BRIGHT=$(xbacklight -ctrl asus::kbd_backlight -get);
xbacklight -ctrl asus::kbd_backlight -set $(expr $CUR_BRIGHT + 33) #range is 0-3
