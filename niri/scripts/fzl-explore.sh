#!/usr/bin/env bash
current_dir=$(pwd)

TERMINAL="foot" 

while true; do
    selection=$( (echo ".."; ls -F --group-directories-first) | fuzzel --dmenu --prompt "Search File ❯ ")
    [[ -z "$selection" ]] && exit 0
    
    clean_selection="${selection%/}"
    clean_selection="${clean_selection%*}"

    if [[ "$selection" == ".." ]]; then
        cd ..
        current_dir=$(pwd)
        continue
    fi

    if [[ -d "$clean_selection" ]]; then
        cd "$clean_selection" || exit 1
        current_dir=$(pwd)
    elif [[ -f "$clean_selection" ]]; then
        mime_type=$(file --mime-type -b "$clean_selection")
        
        if [[ "$mime_type" == text/* ]]; then
            $TERMINAL -e nvim "$clean_selection" &> /dev/null &
        else
            xdg-open "$clean_selection" &> /dev/null &
        fi
        exit 0
    fi
done
