#!/bin/bash
SRC_DIR=$(dirname "$0")
for fn in ".bash_aliases"
do
    ln -s "$SRC_DIR/$fn" "$HOME/$fn"
done
