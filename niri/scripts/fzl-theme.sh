#!/usr/bin/env bash

theme=$(printf '%s\n' \
    "Catppuccin Mocha" \
    "Rose Pine" \
    "Pywal" |
    fuzzel --dmenu --prompt "Choose theme ❯ " --lines=5 --width=20)

case "$theme" in
    "Catppuccin Mocha")
        waybar_import='@import "colors/mocha.css";'
        foot_import='include=~/.config/foot/colors/mocha.ini'
        niri_import='include "colors/mocha.kdl" // THEME'
        mako_import='include=~/.config/mako/colors/mocha'
        fuzzel_import='include = ~/.config/fuzzel/colors/mocha.ini'
        ;;

    "Rose Pine")
        waybar_import='@import "colors/rose-pine.css";'
        foot_import='include=~/.config/foot/colors/rose-pine.ini'
        niri_import='include "colors/rose-pine.kdl" // THEME'
        mako_import='include=~/.config/mako/colors/rose-pine'
        fuzzel_import='include = ~/.config/fuzzel/colors/rose-pine.ini'
        ;;

    "Pywal")
        waybar_import="@import \"$HOME/.cache/wal/colors-waybar.css\";"
        foot_import="include=$HOME/.cache/wal/colors-foot-dark.ini"
        niri_import="include \"$HOME/.cache/wal/colors-niri.kdl\" // THEME"
        mako_import="include=$HOME/.cache/wal/colors-mako"
        fuzzel_import="include = $HOME/.cache/wal/colors-fuzzel.ini"
        ;;

    *)
        exit 0
        ;;
esac

sure=$(printf '%s\n' "Yes" "No" |
    fuzzel --dmenu --prompt "Change? ❯ " --lines=2 --width=20)

case "$sure" in
    "Yes")
        sed -i "s|^@import .*;$|$waybar_import|" \
            ~/.config/waybar/style.css

        sed -i "s|^include=.*$|$foot_import|" \
            ~/.config/foot/foot.ini

        sed -i "s|^include .*// THEME$|$niri_import|" \
            ~/.config/niri/config.kdl

        sed -i "s|^include=.*$|$mako_import|" \
            ~/.config/mako/config

        sed -i "s|^include = .*\.ini$|$fuzzel_import|" \
            ~/.config/fuzzel/fuzzel.ini

        swaybg -m -fill -i "$wallpaper" & 

        makoctl reload &
        killall waybar 2>/dev/null
        waybar &
        ;;

    "No")
        exit 0
        ;;

    *)
        exit 0
        ;;
esac
