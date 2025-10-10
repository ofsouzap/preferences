#!/bin/bash

choice=$(printf "Monitor (Home)\nLaptop (Normal)\nLaptop (Zoomed 2x2)\n" | rofi -i -dmenu -p "Display Layout")

case "$choice" in
    "Monitor (Home)")
        "$HOME/.config/i3/screenlayouts/monitor-home.sh"
        i3-msg "workspace 1; move workspace to output HDMI-A-0"
        i3-msg "workspace 2; move workspace to output eDP"
        i3-msg "workspace 1; focus"
        ;;
    "Laptop (Normal)")
        "$HOME/.config/i3/screenlayouts/laptop-only.sh"
        ;;
    "Laptop (Zoomed 2x2)")
        "$HOME/.config/i3/screenlayouts/laptop-only-zoomed-2x2.sh"
        ;;
esac

# I configure the keyboard mapping here as I'll often run this script on first starting my PC
setxkbmap -layout us -option caps:swapescape

