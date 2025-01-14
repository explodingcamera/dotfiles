#!/usr/bin/env bash

# Check if /etc/nixos is a symbolic link
if [ -L /etc/nixos ]; then
    echo "/etc/nixos is already a link, bootstrap has already run."
    exit 0
fi

# Check if the script is run as root (sudo)
if [[ "$(id -u)" -ne 0 ]]; then
    echo "This script needs to be run as root. Trying to run with sudo..."
    sudo "$0" "$@"
    exit 0
fi

nix-shell -p yadm --run "yadm pull https://github.com/explodingcamera/dotfiles"
mkdir ~/.config/nixos/system
mv /etc/nixos /etc/nixos-old
cp /etc/nixos-old/configuration.nix ~/.config/nixos/system/configuration.nix
cp /etc/nixos-old/hardware-configuration.nix ~/.config/nixos/system/hardware-configuration.nix
ln -s ~/.config/nixos /etc/nixos
nixos-rebuild switch --flake .#nixos