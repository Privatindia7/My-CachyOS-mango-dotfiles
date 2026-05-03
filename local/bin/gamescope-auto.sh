#!/bin/bash
exec gamescope -f -r 144 -W 2560 -H 1440 -w 1440 -h 1080 --force-grab-cursor --scaler stretch -- "$@"
