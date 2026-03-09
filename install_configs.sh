#!/bin/bash

CONFIG_DIR="/tmp/dotfiles"

echo "Installing configs..."

if [ -d "$CONFIG_DIR" ]; then
    rm -rf "$CONFIG_DIR"
fi

git clone https://github.com/OlegSuperBro/arch-dotfiles "$CONFIG_DIR" || { echo "Failed to clone dotfiles"; exit 1; }

cd "$CONFIG_DIR" || exit 1

bash install.sh || { echo "Config installation failed"; exit 1; }

echo "Configs installed successfully."
exit 0
