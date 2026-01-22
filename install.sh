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

configure_wsl() {
    # Replace /etc/wsl.conf for current WSL instance

}

main() {
    # TODO: Establish way to automatically distinguish between Linux Mint setup and WSL setup
    case "$OSTYPE" in
        linux*)
            ;;
    esac

    #create_symlinks
}

main "$@"