#!/bin/bash

DOWNLOADS="$HOME/Downloads"
BILDER="$HOME/Bilder"
ALT="$HOME/Downloads/Alte Dateien"
ALT_TAGE=30

mkdir -p "$BILDER"
mkdir -p "$ALT"

echo "==> Bilder sortieren..."
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) | while read -r img; do
    mv "$img" "$BILDER/"
    echo "Verschoben: $(basename "$img")"
done

echo "==> Alte Dateien verschieben..."
find "$DOWNLOADS" -maxdepth 1 -type f -mtime +$ALT_TAGE | while read -r f; do
    mv "$f" "$ALT/"
    echo "Verschoben: $(basename "$f")"
done

notify-send -t 4000 "Downloads" "Aufgeräumt! Bilder → Bilder, Alte Dateien → Alte Dateien ✓"
echo "==> Fertig!"
