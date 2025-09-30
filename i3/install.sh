#!/bin/bash
SRC_DIR=$(dirname "$PWD/${BASH_SOURCE[0]}")
for fn in "config" "screenlayouts" "scripts"
do
    rm -f "$HOME/.config/i3/$fn"
    ln -s "$SRC_DIR/$fn" "$HOME/.config/i3/$fn"
done
