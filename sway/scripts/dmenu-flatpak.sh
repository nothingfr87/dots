#!/bin/sh

apps=$(flatpak list --app --columns=name,application \
    | awk -F'\t' '{printf "%s (%s)\n", $1, $2}')

chosen=$(printf "%s\n" "$apps" | dmenu -nb '#1a1b26' -sb '#ad8ee6' -fn 'JetBrainsMono NF:size=10' -p 'Flatpak: ' -h 26)

[ -z "$chosen" ] && exit 0

app_id=$(printf "%s" "$chosen" | sed 's/.*(\(.*\)).*/\1/')

flatpak run "$app_id"
