#!/usr/bin/env bash

# Check if the script is run as root (sudo)
if [[ "$(id -u)" -ne 0 ]]; then
    echo "This script needs to be run as root. Trying to run with sudo..."
    sudo "$0" "$@"
    exit 0
fi

ln -s ~/.config/nixos /etc/nixos