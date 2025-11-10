#!/bin/bash
SRC_DIR=$(dirname "$PWD/${BASH_SOURCE[0]}")
for fn in "config.jsonc" "style.css" "custom-scripts"
do
    rm -f "$HOME/.config/waybar/$fn"
    ln -s "$SRC_DIR/$fn" "$HOME/.config/waybar/$fn"
done
