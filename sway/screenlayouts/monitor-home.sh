#!/usr/bin/env bash

swaymsg output HDMI-A-1 enable mode 1920x1080 pos 0 0 transform normal
swaymsg output eDP enable mode 2880x1800 pos 1920 122 transform normal

# Disable other outputs
for o in DisplayPort-0 DisplayPort-1 DisplayPort-2 DisplayPort-3 DisplayPort-4 DisplayPort-5; do
  swaymsg output "$o" disable
done
