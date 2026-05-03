#!/bin/bash
# $1 = session name (gnome oder niri)
printf '[User]\nSession=%s\n' "$1" > /var/lib/AccountsService/users/vic
