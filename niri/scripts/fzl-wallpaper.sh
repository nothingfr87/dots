#!/usr/bin/env bash

wal_root="$HOME/walls"
wal_dir="$wal_root"

while true; do
    cd "$wal_dir" || exit 1

    selection=$(
        {
            [[ "$wal_dir" != "$wal_root" ]] && echo ".."

            find . -maxdepth 1 -mindepth 1 -type d -printf ' %f\n'
            find . -maxdepth 1 -mindepth 1 -type f -printf '%f\n'
        } |
        fuzzel --dmenu --prompt "Set Wallpaper ❯ "
    )

    if [[ -z "$selection" ]]; then
        notify-send "Cancelled" "Wallpaper selection has been cancelled."
        exit 0
    fi

    if [[ "$selection" == ".." ]]; then
        wal_dir=$(dirname "$wal_dir")
        continue
    fi

    name="${selection# }"
    path="$wal_dir/$name"

    if [[ -d "$path" ]]; then
        wal_dir="$path"
        continue
    fi

    if [[ -f "$path" ]]; then
        pkill swaybg 2>/dev/null
        swaybg -m fill -i "$path" &

        notify-send "Wallpaper Changed" "Wallpaper has been changed successfully."

        pywal=$(
            printf "Yes\nNo" |
            fuzzel --dmenu --prompt "Reload Pywal? ❯ "
        )

        case "$pywal" in
            Yes)
                if wal -i "$path"; then
                    notify-send "Pywal Reloaded" "Colors have been updated successfully."
                else
                    notify-send "Pywal Error" "Failed to reload Pywal."
                fi
                ;;
            No)
                notify-send "Pywal Skipped" "Pywal was not reloaded."
                ;;
            "")
                notify-send "Pywal Cancelled" "Pywal reload was cancelled."
                ;;
        esac

        exit 0
    fi
done
