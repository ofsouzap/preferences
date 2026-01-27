#!/bin/bash

OPTION_swap_caps_esc_on="Swap CAPS <-> ESC [ENABLE]"
OPTION_swap_caps_esc_off="Swap CAPS <-> ESC [DISABLE]"

choice=$(printf "$OPTION_swap_caps_esc_on\n$OPTION_swap_caps_esc_off\n" | fuzzel --dmenu)

case "$choice" in
    "$OPTION_swap_caps_esc_on")
        swaymsg "input type:keyboard xkb_options caps:swapescape"
        notify-send -u low -t 2000 "Quick Actions" "CAPS-ESC swapping enabled"
        ;;
    "$OPTION_swap_caps_esc_off")
        swaymsg "input type:keyboard xkb_options ''"
        notify-send -u low -t 2000 "Quick Actions" "CAPS-ESC swapping disabled"
        ;;
esac

