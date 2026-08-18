#!/usr/bin/env bash

SELECTIONS="Power Off\nReboot\nSuspend\nLog Out\nLock Screen"

chosen=$(echo -e "$SELECTIONS" | fuzzel --dmenu --prompt "Power Menu ❯ " --lines=5 --width=20)

case "$chosen" in
    *"Power Off"*)
        sure=$(echo -e "Yes\nNo" | fuzzel --dmenu --prompt "Shutdown? ❯ " --lines=2 --width=20)
        case "$sure" in
          *"Yes"*)
            systemctl poweroff
            ;;
          *"No"*|*)
            exit 0
            ;;
        esac
        ;;
    *"Reboot"*)
        systemctl reboot
        ;;
    *"Suspend"*)
        systemctl suspend
        ;;
    *"Log Out"*)
        loginctl terminate-user "$USER"
        ;;
    *"Lock Screen"*)
        if command -v hyprlock &> /dev/null; then
            hyprlock
        elif command -v swaylock &> /dev/null; then
            swaylock
        fi
        ;;
    *)
        exit 0
        ;;
esac
