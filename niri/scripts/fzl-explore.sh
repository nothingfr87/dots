#!/usr/bin/env bash
current_dir=$(pwd)

while true; do
    selection=$( (echo ".."; ls -F --group-directories-first) | fuzzel --dmenu --prompt "Search File ❯ ")
    [[ -z "$selection" ]] && exit 0
    if [[ "$selection" == ".." ]]; then
        cd ..
        current_dir=$(pwd)
        continue
    fi
    if [[ -d "$selection" ]]; then
        cd "$selection" || exit 1
        current_dir=$(pwd)
    elif [[ -f "$selection" ]]; then
        xdg-open "$selection" &> /dev/null &
        exit 0
    fi
done
