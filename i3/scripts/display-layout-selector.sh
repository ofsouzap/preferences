#!/bin/bash

choice=$(printf "Monitor (Home)\nLaptop (Normal)\nLaptop (Zoomed 0.7x0.7)\nLaptop (Zoomed 0.5x0.5)\n" | rofi -i -dmenu -p "Display Layout")

case "$choice" in
    "Monitor (Home)")
        "$HOME/.config/i3/screenlayouts/monitor-home.sh"
        ;;
    "Laptop (Normal)")
        "$HOME/.config/i3/screenlayouts/laptop-only.sh"
        ;;
    "Laptop (Zoomed 0.7x0.7)")
        "$HOME/.config/i3/screenlayouts/laptop-only-zoomed-0.7x0.7.sh"
        ;;
    "Laptop (Zoomed 0.5x0.5)")
        "$HOME/.config/i3/screenlayouts/laptop-only-zoomed-0.5x0.5.sh"
        ;;
esac

# I configure the keyboard mapping here as I'll often run this script on first starting my PC
setxkbmap -layout us -option caps:swapescape -option compose:ralt

