#!/bin/bash
SRC_DIR=$(dirname "$PWD/${BASH_SOURCE[0]}")
for fn in "keybindings.json" "settings.json" "tasks.json"
do
    ln -s "$SRC_DIR/$fn" "$HOME/.config/Code/User/$fn"
done
