#!/usr/bin/env bash

theme=$(printf '%s\n' \
    "Catppuccin Mocha" \
    "Rose Pine" |
    fuzzel --dmenu --prompt "Choose theme ❯ " --lines=5 --width=20)

case "$theme" in
    "Catppuccin Mocha")
        theme="mocha"
        ;;
    "Rose Pine")
        theme="rose-pine"
        ;;
    *)
        exit 0
        ;;
esac

sure=$(printf '%s\n' "Yes" "No" |
    fuzzel --dmenu --prompt "Change? ❯ " --lines=2 --width=20)

case "$sure" in
    "Yes")
        sed -i "s|@import \"colors/.*\.css\";|@import \"colors/$theme.css\";|" \
            ~/.config/waybar/style.css

        sed -i "s|^include=~/.config/foot/colors/.*\.ini$|include=~/.config/foot/colors/$theme.ini|" \
            ~/.config/foot/foot.ini

        sed -i "s|^include \"colors/.*\.kdl\"$|include \"colors/$theme.kdl\"|" \
            ~/.config/niri/config.kdl

        sed -i "s|^include=~/.config/mako/colors/.*$|include=~/.config/mako/colors/$theme|" \
            ~/.config/mako/config

        sed -i "s|^include = ~/.config/fuzzel/colors/.*\.ini$|include = ~/.config/fuzzel/colors/$theme.ini|" \
            ~/.config/fuzzel/fuzzel.ini
        ;;
    "No")
        exit 0
        ;;
    *)
        exit 0
        ;;
esac

echo "$theme"
