#!/bin/bash
SRC_DIR=$(dirname "$PWD/${BASH_SOURCE[0]}")
for fn in ".bash_aliases"
do
    ln -s "$SRC_DIR/$fn" "$HOME/$fn"
done
