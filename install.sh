#!/bin/bash

# This script installs all system-level dependencies for the Neovim configuration.
# It is designed for Debian/Ubuntu-based systems.

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Updating package list..."
sudo apt update

# --- Build Essentials for Neovim from Source ---
echo "Installing build essentials for Neovim..."
sudo apt install -y git ninja-build gettext cmake unzip curl build-essential

# --- C++ Toolchain ---
echo "Installing C++ toolchain (g++, gdb, cmake)..."
sudo apt install -y g++ gdb # cmake is already installed above

# --- Plugin Dependencies ---
echo "Installing dependencies for Neovim plugins..."
# For nvim-treesitter (parser compilation)
sudo apt install -y nodejs npm
# For clipboard integration on X11
sudo apt install -y xclip
# For Doxygen/UML generation
sudo apt install -y doxygen graphviz

echo "--- Building Neovim from Source (Nightly) ---"
if [ -d "$HOME/git/neovim" ]; then
    echo "Neovim directory already exists. Pulling latest changes..."
    cd "$HOME/git/neovim"
    git pull origin master
else
    echo "Cloning Neovim repository..."
    mkdir -p "$HOME/git"
    cd "$HOME/git"
    git clone https://github.com/neovim/neovim
    cd neovim
fi

echo "Building Neovim..."
make clean
make CMAKE_BUILD_TYPE=RelWithDebInfo

echo "Installing Neovim..."
cd build
cpack -G DEB
sudo dpkg -i nvim-linux-x86_64.deb

echo "------------------------------------------"
echo "All dependencies installed successfully!"
echo "Neovim nightly has been built and installed."
echo "------------------------------------------"
