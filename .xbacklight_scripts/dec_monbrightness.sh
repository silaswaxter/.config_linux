#!/bin/bash
CUR_BRIGHT=$(xbacklight -get);
xbacklight -set $(expr $CUR_BRIGHT - 10)
