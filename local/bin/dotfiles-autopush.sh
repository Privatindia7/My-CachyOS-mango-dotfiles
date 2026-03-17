#!/bin/bash

DOTFILES="$HOME/dotfiles"

cp -r ~/.config/fish/* "$DOTFILES/config/fish/"
cp -r ~/.config/ghostty/* "$DOTFILES/config/ghostty/"
cp ~/.local/bin/*.sh "$DOTFILES/local/bin/"

cd "$DOTFILES"

if git diff --quiet && git diff --cached --quiet; then
    echo "Keine Änderungen."
    notify-send -t 4000 "Dotfiles" "Keine Änderungen – nichts gepusht."
    exit 0
fi

git add .
git commit -m "Auto-update $(date '+%Y-%m-%d')"
git push
echo "Gepusht!"
notify-send -t 4000 "Dotfiles" "Erfolgreich gepusht! ✓"
