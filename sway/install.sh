#!/bin/bash
SRC_DIR=$(dirname "$PWD/${BASH_SOURCE[0]}")
for fn in "config" "screenlayouts" "scripts"
do
    rm -f "$HOME/.config/sway/$fn"
    ln -s "$SRC_DIR/$fn" "$HOME/.config/sway/$fn"
done
