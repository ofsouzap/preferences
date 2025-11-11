#!/usr/bin/env bash

swaymsg output eDP enable mode 2880x1800 pos 0 0 transform normal scale 1

for o in HDMI-A-1 DisplayPort-0 DisplayPort-1 DisplayPort-2 DisplayPort-3 DisplayPort-4 DisplayPort-5; do
  swaymsg output "$o" disable
done
