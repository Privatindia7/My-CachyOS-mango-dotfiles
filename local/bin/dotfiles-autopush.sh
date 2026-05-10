#!/bin/bash

DOTFILES="$HOME/dotfiles"

cp ~/.zshrc "$DOTFILES/zshrc"
cp ~/.zprofile "$DOTFILES/zprofile"
cp -r ~/.config/ghostty/* "$DOTFILES/config/ghostty/"
cp ~/.local/bin/*.sh "$DOTFILES/local/bin/"

# NEU: Paketlisten immer aktuell halten und ins Repo kopieren
pacman -Qqe > ~/explicitly-installed.txt
pacman -Qqm > ~/aur-packages.txt
cp ~/explicitly-installed.txt ~/aur-packages.txt "$DOTFILES/"

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
23


/home/vic/.local/bin/dotfiles-autopush.sh (1,1) | ft:shell | unix | utf-8Alt-g: bindings
Warning: file is readonly - sudo will be attempted when saving
