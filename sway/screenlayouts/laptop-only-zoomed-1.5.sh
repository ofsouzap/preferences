#!/usr/bin/env bash

wlr-randr --output eDP-1 --on --preferred --mode 2880x1800 --pos 0,0 --scale 1.5

for o in HDMI-A-1
do
    wlr-randr --output "$o" --off
done
