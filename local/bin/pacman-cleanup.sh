#!/bin/bash

echo "==> Pacman Cache cleanup..."
paru -Sc --noconfirm

echo "==> Waisen-Pakete entfernen..."
orphans=$(paru -Qdtq)
if [ -n "$orphans" ]; then
    echo "$orphans"
    read -rp "Diese entfernen? [j/N] " confirm
    [[ "$confirm" == "j" ]] && paru -Rns $orphans --noconfirm
    notify-send -t 4000 "Pacman" "Cleanup abgeschlossen ✓"
else
    echo "Keine Waisen gefunden."
    notify-send -t 4000 "Pacman" "Keine Waisen-Pakete gefunden ✓"
fi

echo "==> Fertig!"
