#!/bin/bash

LOGDIR="$HOME/proton-crashes"
mkdir -p "$LOGDIR"

find "$HOME/.steam/steam/steamapps/compatdata" -name "*.log" -newer "$LOGDIR/.last_run" 2>/dev/null | while read -r log; do
    appid=$(echo "$log" | grep -oP 'compatdata/\K[0-9]+')
    timestamp=$(date +%Y-%m-%d_%H-%M)
    cp "$log" "$LOGDIR/${appid}_${timestamp}.log"
    echo "Gesichert: ${appid}_${timestamp}.log"
done

touch "$LOGDIR/.last_run"
echo "==> Logs in $LOGDIR"
