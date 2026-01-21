#!/bin/bash

choice=$(printf "Monitor (Home)\nLaptop (Normal)\nLaptop (x1.5)\nLaptop (x2)\n" | fuzzel --dmenu)

case "$choice" in
    "Monitor (Home)")
        "$HOME/.config/sway/screenlayouts/monitor-home.sh"
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

