#!/bin/bash

HTML="$1"
OUT="${2:-output.gif}"
FRAMES_DIR="/tmp/gif-frames"
WIDTH=800
HEIGHT=440
FPS=30
DURATION=4

mkdir -p "$FRAMES_DIR"
rm -f "$FRAMES_DIR"/*.png

echo "==> Frames aufnehmen..."
for i in $(seq 0 $((DURATION * FPS - 1))); do
    TIME=$(echo "scale=3; $i / $FPS" | bc)
    chromium --headless --disable-gpu \
        --screenshot="$FRAMES_DIR/frame_$(printf '%04d' $i).png" \
        --window-size="$WIDTH,$HEIGHT" \
        --virtual-time-budget=$((i * 1000 / FPS)) \
        "file://$HTML" 2>/dev/null
done

echo "==> GIF erstellen..."
gifski --fps $FPS --width $WIDTH -o "$OUT" "$FRAMES_DIR"/frame_*.png

echo "==> Fertig: $OUT"
