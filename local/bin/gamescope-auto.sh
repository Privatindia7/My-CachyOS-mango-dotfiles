#!/bin/bash

if wlr-randr | grep -q "DP-"; then
    exec gamescope -f -r 144 -w 2560 -h 1440 --force-grab-cursor -- "$@"
else
    exec gamescope -f -r 75 -w 1440 -h 900 --force-grab-cursor -- "$@"
fi
