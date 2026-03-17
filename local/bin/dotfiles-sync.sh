#!/bin/bash

DOTFILES="$HOME/dotfiles"
mkdir -p "$DOTFILES"

# Configs die du sichern willst
declare -A CONFIGS=(
    ["$HOME/.config/MangoWM"]="config/MangoWM"
    ["$HOME/.config/fish"]="config/fish"
    ["$HOME/.config/ghostty"]="config/ghostty"
    ["$HOME/.config/brave-flags.conf"]="config/brave-flags.conf"
    ["$HOME/.local/bin"]="local/bin"
)

MODE="${1:-backup}"

if [[ "$MODE" == "backup" ]]; then
    echo "==> Configs nach $DOTFILES sichern..."
    for src in "${!CONFIGS[@]}"; do
        dest="$DOTFILES/${CONFIGS[$src]}"
        mkdir -p "$(dirname "$dest")"
        rsync -av "$src" "$dest"
    done
    echo "==> Fertig! Jetzt: cd ~/dotfiles && git add . && git commit && git push"

elif [[ "$MODE" == "restore" ]]; then
    echo "==> Configs von $DOTFILES wiederherstellen..."
    for src in "${!CONFIGS[@]}"; do
        dest="$DOTFILES/${CONFIGS[$src]}"
        rsync -av "$dest" "$src"
    done
    echo "==> Fertig!"
fi
