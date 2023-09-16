#!/usr/bin/env bash
set -e

CONF_DIR=${XDG_CONFIG_HOME:-"$HOME/.config"}
NVIM_CONF_DIR="$CONF_DIR/nvim"
NVCHAD_CUSTOM_DIR="$NVIM_CONF_DIR/lua/custom"

if [ ! -d "$NVCHAD_CUSTOM_DIR" ]; then
  echo "NvChad custom dir was not found"
  exit 1
fi

read -p "Do you want to reset current NvChad custom dir (y/N) " CONFIRM

if [ ! "${CONFIRM,,}" = "y" ]; then
  echo "Aborting..."
  exit 0
fi

rm -rf "$NVCHAD_CUSTOM_DIR" && mkdir "$NVCHAD_CUSTOM_DIR"
git clone https://github.com/dghilardi/nvim-conf.git "$NVIM_CONF_DIR/lua/custom"
