#!/bin/bash

BUILD_DIR="/tmp/other_apps_build"

mkdir -p "$BUILD_DIR"

echo "Installing yay..."

cd "$BUILD_DIR" || exit 1

if [ -d "yay" ]; then
    rm -rf "yay"
fi

git clone https://aur.archlinux.org/yay.git || { echo "Failed to clone yay"; exit 1; }

cd yay || exit 1

makepkg -si || { echo "Failed to build yay"; exit 1; }

echo "yay installed successfully"
echo ""
echo "All other apps installed successfully."
exit 0
