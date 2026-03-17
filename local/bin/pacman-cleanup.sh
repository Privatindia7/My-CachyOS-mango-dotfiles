#!/bin/bash

echo "==> Pacman Cache cleanup..."
paru -Sc --noconfirm

echo "==> Waisen-Pakete entfernen..."
orphans=$(paru -Qdtq)
if [ -n "$orphans" ]; then
    echo "$orphans"
    read -rp "Diese entfernen? [j/N] " confirm
    [[ "$confirm" == "j" ]] && paru -Rns $orphans --noconfirm
else
    echo "Keine Waisen gefunden."
fi

echo "==> Fertig!"
