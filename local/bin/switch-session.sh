#!/bin/bash

ACCOUNTS_FILE="/var/lib/AccountsService/users/vic"
CURRENT=$XDG_CURRENT_DESKTOP

if [[ "$CURRENT" == *"GNOME"* ]]; then
    NEXT="niri"
else
    NEXT="gnome"
fi

# Session für nächsten Login setzen
sudo bash -c "printf '[User]\nSession=$NEXT\n' > $ACCOUNTS_FILE"

# Aktuelle Session beenden
if [[ "$CURRENT" == *"GNOME"* ]]; then
    gnome-session-quit --no-prompt
else
    niri msg action quit --skip-confirmation
fi
