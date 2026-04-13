#!/bin/bash
niri msg action focus-workspace "gaming"
sleep 0.5
if wlr-randr | grep -q "DP-"; then
    exec gamescope -f -r 144 -W 2560 -H 1440 -w 1280 -h 960 --force-grab-cursor --scaler stretch -- "$@"
else
    exec gamescope -f -r 75 -W 1440 -H 900 -w 1280 -h 960 --force-grab-cursor --scaler stretch -- "$@"
fi
