#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Starting Arch installation scripts..."
echo ""

echo "Step 1: Checking dependencies..."
bash "$SCRIPT_DIR/check_dependency.sh" || exit 1
echo ""

echo "Step 2: Installing dwm, st, and dmenu..."
bash "$SCRIPT_DIR/install_dwm.sh" || exit 1
echo ""

echo "Step 3: Installing other apps..."
bash "$SCRIPT_DIR/install_other.sh" || exit 1
echo ""

echo "Step 4: Installing additional packages..."
bash "$SCRIPT_DIR/install_packages.sh" || exit 1
echo ""

echo "Step 5: Installing configs..."
bash "$SCRIPT_DIR/install_configs.sh" || exit 1
echo ""

echo "Installation completed successfully!"
exit 0
