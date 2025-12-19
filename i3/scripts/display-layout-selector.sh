#!/bin/bash

choice=$(printf "Monitor (Home)\nLaptop (1x1)\nLaptop (0.7x0.7)\nLaptop (0.5x0.5)\nMonitor (Home, 1x1)\n" | rofi -i -dmenu -p "Display Layout")

case "$choice" in
    "Monitor (Home)")
        "$HOME/.config/i3/screenlayouts/monitor-home.sh"
        ;;
    "Laptop (1x1)")
        "$HOME/.config/i3/screenlayouts/laptop-only.sh"
        ;;
    "Laptop (0.7x0.7)")
        "$HOME/.config/i3/screenlayouts/laptop-only-zoomed-0.7x0.7.sh"
        ;;
    "Laptop (0.5x0.5)")
        "$HOME/.config/i3/screenlayouts/laptop-only-zoomed-0.5x0.5.sh"
        ;;
    "Monitor (Home, 1x1)")
        "$HOME/.config/i3/screenlayouts/monitor-home-1x1.sh"
        ;;
esac

# I configure the keyboard mapping here as I'll often run this script on first starting my PC
setxkbmap -layout us -option compose:ralt

