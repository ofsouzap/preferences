#!/bin/bash

choice=$(printf "Monitor (Home)\nLaptop\n" | rofi -i -dmenu -p "Display Layout")

case "$choice" in
    "Monitor (Home)")
        "$HOME/.config/i3/screenlayouts/monitor-home.sh"
        ;;
    "Laptop")
        "$HOME/.config/i3/screenlayouts/laptop-only.sh"
        ;;
esac

