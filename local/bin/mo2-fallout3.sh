#!/bin/bash
export WINEPREFIX="/home/vic/.local/share/bottles/bottles/Fallout-3"
gamescope -f -r 144 -w 2560 -h 1440 -- wine "C:\\Modding\\MO2\\ModOrganizer.exe"
wineserver -k
