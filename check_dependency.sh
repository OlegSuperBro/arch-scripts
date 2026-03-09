#!/bin/bash

# List of required dependencies
DEPENDENCIES=(
    "git"
    "xorg-server"
    "libx11"
    "libxinerama"
    "libxft"
    "webkit2gtk"
    "make"
    "base-devel"
)

MISSING_DEPS=()

echo "Checking dependencies..."

for dep in "${DEPENDENCIES[@]}"; do
    if ! pacman -Qi "$dep" &> /dev/null; then
        MISSING_DEPS+=("$dep")
        echo "Missing: $dep"
    else
        echo "Found: $dep"
    fi
done

if [ ${#MISSING_DEPS[@]} -ne 0 ]; then
    echo ""
    echo "Missing dependencies detected."
    echo ""
    read -p "Do you want to install missing dependencies now? (y/n): " answer
    
    if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
        echo "Installing dependencies..."
        sudo pacman -S ${MISSING_DEPS[*]} || { echo "Failed to install dependencies"; exit 1; }
        echo "Dependencies installed successfully."
    else
        echo ""
        echo "Installation cancelled."
        echo "To install dependencies manually, run:"
        echo "sudo pacman -S ${MISSING_DEPS[*]}"
        exit 1
    fi
fi

echo "All dependencies are installed."
exit 0
