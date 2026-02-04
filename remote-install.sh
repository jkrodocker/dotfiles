#!/usr/bin/env bash
# ================================================================================
# remote_install.sh
# ================================================================================
# This script pulls the dotfiles to the current system and runs the install
# script.
# ================================================================================

SOURCE="https://github.com/jkrodocker/dotfiles"
TARGET="${HOME}/.dotfiles"

# Retrieve dotfiles
if ! git clone ${SOURCE} ${TARGET}; then
    echo "Failed to download jkrodocker/dotfiles. Exiting."
    kill $$
fi

# Run install script
INSTALL="{TARGET}/install.sh"
chmod +x ${INSTALL}
./${INSTALL}
