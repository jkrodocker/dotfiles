#!/usr/bin/env bash
# ================================================================================
# remote_install.sh
# ================================================================================
# This script pulls the dotfiles to the current system, and is intended to be used
# on a clean install of WSL Ubuntu.
# ================================================================================

SOURCE="https://github.com/jkrodocker/dotfiles"
TARGET="${HOME}/.dotfiles"

# Retrieve dotfiles
if ! git clone ${SOURCE} ${TARGET}; then
    echo "Failed to download jkrodocker/dotfiles. Exiting."
    kill $$
fi
