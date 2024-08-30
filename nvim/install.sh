#!/bin/bash
SRC_DIR=$(dirname "$PWD/${BASH_SOURCE[0]}")
ln -s "$SRC_DIR" "$HOME/.config/nvim"
