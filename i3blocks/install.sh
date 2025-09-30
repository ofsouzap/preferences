#!/bin/bash
SRC_DIR=$(dirname "$PWD/${BASH_SOURCE[0]}")
for fn in "config"
do
    ln -s "$SRC_DIR/$fn" "$HOME/.config/i3blocks/$fn"
done
