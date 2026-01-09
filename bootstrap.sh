# ================================================================================
# bootstrap.sh
# ================================================================================
# This script sets up from a clean installation of WSL Ubuntu, but should be
# idempotent. This can be pulled by itself and run to automatically pull and
# configure the remainder of the setup
# ================================================================================

# Update and upgrade all packages
sudo apt update && sudo apt upgrade -y

# TODO: Retrieve dotfiles
