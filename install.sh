#!/usr/bin/env bash
# ================================================================================
# install.sh
# ================================================================================
# This script symlinks the dotfiles in this repo to the user's home directory to
# be sourced on startup.
# ================================================================================

show_help() {
cat << EOF
Usage: ${0##*/} [-hd]
This is the install script for my dotfiles.

    -h  display this help and exit
    -d  perform a dry-run rather than full installation
EOF
}

# Handle options
dry_run=0

while getopts hd opt; do
    case $opt in
        h)
            show_help
            exit 0
            ;;
        d)
            dry_run=1
            ;;
        *)
            show_help >&2
            exit 1
            ;;
    esac
done



# Ensure all commands run relative to ~/.dotfiles
cd "$(dirname "${BASH_SOURCE[0]}")" || {
    echo "Failed to cd into dotfiles directory" >&2
    exit 1
}

create_symlinks() {
    declare -a FILES_TO_SYMLINK=(
        ".bash_aliases"
        ".bashrc"
        ".inputrc"
        ".gitconfig"
    )
    
    local i=""
    local source_file=""
    local target_file=""

    for i in "${FILES_TO_SYMLINK[@]}"; do

        source_file="$i"
        target_file="$HOME/$i"

        if [ -e "$source_file" ]; then
            # Ask for confirmation if target already exists
            if [ -e "$target_file" ] || [ -L "$target_file" ]; then
                # TODO: Divide confirmation ask into separate function
                printf "%s already exists. Overwrite it? (y/n): " "${target_file}" >&2
                read -r -n 1 REPLY  
                printf "\n" >&2

                if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
                    continue
                fi
            fi

            # Check if performing dry-run before creating symlink
            if [ $dry_run = 0 ]; then
                ln -sfn "$PWD/$source_file" "$target_file"
            fi

            printf "    %s --> %s/%s\n" "$target_file" "$PWD" "$source_file" >&2
        else
            printf "Could not find %s, skipping.\n" "$source_file" >&2
        fi
    done
}

main() {
    # TODO: Establish way to automatically distinguish between Linux Mint setup and WSL setup

    create_symlinks "$@"
}

main "$@"