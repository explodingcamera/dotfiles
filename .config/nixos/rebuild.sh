#!/usr/bin/env bash

if [[ "$(id -u)" -ne 0 ]]; then
    echo "This script needs to be run as root. Trying to run with sudo..."
    sudo "$0" "$@"
    exit 0
fi

nixos-rebuild switch