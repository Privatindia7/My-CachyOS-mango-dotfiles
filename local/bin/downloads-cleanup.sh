#!/bin/bash

DOWNLOADS="$HOME/Downloads"
BILDER="$HOME/Pictures/auto-sorted"
ALT_TAGE=30

mkdir -p "$BILDER"

echo "==> Bilder sortieren..."
find "$DOWNLOADS" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) | while read -r img; do
    mv "$img" "$BILDER/"
    echo "Verschoben: $(basename "$img")"
done

echo "==> Alte Dateien (älter als ${ALT_TAGE} Tage)..."
find "$DOWNLOADS" -maxdepth 1 -type f -mtime +$ALT_TAGE | while read -r f; do
    echo "  $f"
done

read -rp "Diese löschen? [j/N] " confirm
if [[ "$confirm" == "j" ]]; then
    find "$DOWNLOADS" -maxdepth 1 -type f -mtime +$ALT_TAGE -delete
    echo "Gelöscht."
fi
