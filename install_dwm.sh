#!/bin/bash

APPS=(
    "https://github.com/OlegSuperBro/dwm"
    "https://git.suckless.org/st"
    "https://git.suckless.org/dmenu"
)

BUILD_DIR="/tmp/suckless_build"

mkdir -p "$BUILD_DIR"

echo "Installing dwm, st, and dmenu..."

for app_url in "${APPS[@]}"; do
    app_name=$(basename "$app_url")
    echo ""
    echo "Installing $app_name..."
    
    cd "$BUILD_DIR" || exit 1
    
    if [ -d "$app_name" ]; then
        rm -rf "$app_name"
    fi
    
    git clone "$app_url" || { echo "Failed to clone $app_name"; exit 1; }
    
    cd "$app_name" || exit 1
    
    sudo make clean install || { echo "Failed to build $app_name"; exit 1; }
    
    echo "$app_name installed successfully"
done

echo ""
echo "All suckless tools installed successfully."
exit 0
