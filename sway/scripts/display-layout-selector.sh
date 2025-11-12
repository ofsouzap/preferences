#!/bin/bash

choice=$(printf "Monitor (Home)\nLaptop (Normal)\n" | wofi --dmenu --prompt "Display Layout")

case "$choice" in
    "Monitor (Home)")
        "$HOME/.config/sway/screenlayouts/monitor-home.sh"
        swaymsg "workspace 1; move workspace to output HDMI-A-1"
        swaymsg "workspace 2; move workspace to output eDP"
        swaymsg "workspace 1; focus"
        ;;
    "Laptop (Normal)")
        "$HOME/.config/sway/screenlayouts/laptop-only.sh"
        ;;
esac

