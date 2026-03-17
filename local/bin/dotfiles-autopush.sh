#!/bin/bash

DOTFILES="$HOME/dotfiles"

# Aktuelle Configs ins Repo kopieren
cp -r ~/.config/fish/* "$DOTFILES/config/fish/"
cp -r ~/.config/ghostty/* "$DOTFILES/config/ghostty/"
cp ~/.local/bin/*.sh "$DOTFILES/local/bin/"

cd "$DOTFILES"

# Prüfen ob sich was geändert hat
if git diff --quiet && git diff --cached --quiet; then
    echo "Keine Änderungen."
    exit 0
fi

git add .
git commit -m "Auto-update $(date '+%Y-%m-%d')"
git push
echo "Gepusht!"
