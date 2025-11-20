#!/bin/sh
xrandr \
    --output eDP --mode 1920x1200 --pos 1920x122 --rotate normal --scale 0.7x0.7 \
    --output HDMI-A-0 --primary --mode 1920x1080 --pos 0x0 --rotate normal \
    --output DisplayPort-0 --off \
    --output DisplayPort-1 --off \
    --output DisplayPort-2 --off \
    --output DisplayPort-3 --off \
    --output DisplayPort-4 --off \
    --output DisplayPort-5 --off
