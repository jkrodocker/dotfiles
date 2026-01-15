#!/usr/bin/env bash
# ================================================================================
# install.sh
# ================================================================================
# This script symlinks the dotfiles in this repo to the user's home directory to
# be sourced on startup.
# ================================================================================

cd "$(dirname ${BASH_SOURCE[0]})"

create_symlinks() {
    declare -a FILES_TO_SYMLINK=(
        ".bash_aliases"
        ".bashrc"
        ".inputrc"
        ".gitconfig"
    )
    
    file=""

    for file in ${FILES_TO_SYMLINK[@]}; do
        if [ -e $file ]; then
            read -r -n 1
            
        fi
    done
}

main() {


    create_symlinks
}

main "$@"