#!/bin/bash

# Add your additional packages here
PACKAGES=(
    "7zip"
    "bat"
    "blender"
    "btop"
    "docker"
    "docker-compose"
    "flatpak"
    "firefox"
    "fzf"
    "gimp"
    "godot"
    "heroic-games-launcher-bin"
    "input-remapper"
    "krita"
    "man-db"
    "mesa-utils"
    "mpv"
    "nvtop"
    "obs-studio-tytan652"
    "obsidian"
    "opentabletdriver"
    "osu-lazer-bin"
    "pavucontrol"
    "pinta"
    "pipewire"
    "pipewire-alsa"
    "pipewire-jack"
    "pipewire-pulse"
    "prismlauncher"
    "protontricks"
    "qbittorrent"
    "qsynth"
    "rocm-hip-runtime"
    "rsync"
    "rustup"
    "scanmem"
    "soundfont-fluid"
    "steam"
    "strace"
    "tetrio-plus-bin"
    "timg"
    "v2rayn-bin"
    "v4l2loopback-dkms"
    "vesktop"
    "visual-studio-code-bin"
    "vulkan-radeon"
    "wget"
    "wine-mono"
    "wine32"
    "winetricks"
    "yt-dlp"
    "zerotier-one"
    "zola"
)

if [ ${#PACKAGES[@]} -eq 0 ]; then
    echo "No additional packages to install."
    exit 0
fi

echo "Installing additional packages..."

for package in "${PACKAGES[@]}"; do
    echo "  - $package"
done

echo ""
read -p "Do you want to install these packages? (y/n): " answer

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    yay -S ${PACKAGES[*]} || { echo "Failed to install packages"; exit 1; }
    echo "Additional packages installed successfully."
else
    echo "Skipping additional packages installation."
fi

exit 0
