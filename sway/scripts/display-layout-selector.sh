#!/bin/bash

choice=$(printf "Monitor (Home)\nLaptop (Normal)\nLaptop (x1.5)\nLaptop (x2)\n" | rofi -i -dmenu -p "Display Layout")

case "$choice" in
    "Monitor (Home)")
        "$HOME/.config/sway/screenlayouts/monitor-home.sh"
        swaymsg "workspace 1; move workspace to output HDMI-A-1"
        swaymsg "workspace 2; move workspace to output eDP-1"
        swaymsg "workspace 1; focus"
        ;;
    "Laptop (Normal)")
        "$HOME/.config/sway/screenlayouts/laptop-only.sh"
        ;;
    "Laptop (x1.5)")
        "$HOME/.config/sway/screenlayouts/laptop-only-zoomed-1.5.sh"
        ;;
    "Laptop (x2)")
        "$HOME/.config/sway/screenlayouts/laptop-only-zoomed-2.sh"
        ;;
esac

