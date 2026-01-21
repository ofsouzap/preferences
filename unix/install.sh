#!/bin/bash
SRC_DIR=$(dirname "$PWD/${BASH_SOURCE[0]}")
for fn in ".bash_aliases" ".bash_extra_config"
do
    ln -s "$SRC_DIR/$fn" "$HOME/$fn"
done

echo "[Don't forget to check that files are sourced in '.bashrc']"

