#!/bin/bash
#
# macsh - macOS installation shell script.

SOURCE_DIR="${HOME}"/Source

main() {
    # Export the XDG environment variables if they aren't already.
    export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"${HOME}/.config"}"
    export XDG_CACHE_HOME="${XDG_CACHE_HOME:-"${HOME}/.cache"}"
    export XDG_DATA_HOME="${XDG_DATA_HOME:-"${HOME}/.local/share"}"
    export XDG_BIN_HOME="${XDG_BIN_HOME:-"${HOME}/.local/bin"}"
    export XDG_LIB_HOME="${XDG_LIB_HOME:-"${HOME}/.local/lib"}"

    # Create all directories beforehand.
    mkdir -p "${XDG_CONFIG_HOME}"
    mkdir -p "${XDG_CACHE_HOME}"
    mkdir -p "${XDG_DATA_HOME}"
    mkdir -p "${XDG_BIN_HOME}"
    mkdir -p "${XDG_LIB_HOME}"

    # homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

    # system configuration
    mkdir -p "${SOURCE_DIR}"/GitHub/craigsloggett
    cd "${SOURCE_DIR}"/GitHub/craigsloggett
    
    git clone https://github.com/craigsloggett/scripts.git

    cd "${SOURCE_DIR}"/GitHub/craigsloggett/scripts/macOS

    find etc -type d | while read -r dir; do
        sudo mkdir -p "${dir}"
    done

    find etc ! -type d | while read -r file; do
        sudo cp "$file" "/${file}"
    done

    # dotfiles
    cd "${SOURCE_DIR}"/GitHub/craigsloggett
    git clone -b macOS https://github.com/craigsloggett/dotfiles.git

}

main "$@"

#
#    # Clone dotfiles.
#    mkdir -p "${SOURCE_DIR}"/GitHub/craigsloggett
#    cd "${SOURCE_DIR}"/GitHub/craigsloggett
#    
#    git clone -b macOS https://github.com/craigsloggett/dotfiles.git
#
#    # Configure zsh
#    cd dotfiles/zsh
# Setup ZSH
#sudo install -C -m 644 etc/zshenv /etc/zshenv

## Setup XDG Directories
#mkdir -p "${_XDG_CONFIG_HOME}"
#mkdir -p "${_XDG_CACHE_HOME}"
#mkdir -p "${_XDG_DATA_HOME}"

## SSH
#mkdir -p "${HOME}"/.ssh
#scp "${SECURITY_USER}"@"${SECURITY_HOST}":"${SECURITY_DIR}"/ssh/"${COMPANY_NAME}"/id_ed25519 "${HOME}"/.ssh
#scp "${SECURITY_USER}"@"${SECURITY_HOST}":"${SECURITY_DIR}"/ssh/"${COMPANY_NAME}"/id_ed25519.pub "${HOME}"/.ssh

# Export the values in /etc/zshenv

# Setup GPG

# Setup Pash

# Setup Firefox

#637387

#!/usr/bin/env sh

# Default values for blank parameters
#DEBUG=0
#IN_FILE=/etc/some-input-file.conf
#OUT_FILE=/var/log/some-output-file.log
#
## Option parser, the order doesn't matter
#while [ $# -gt 0 ]; do
#    case "$1" in
#        -i|--input)
#            IN_FILE="$2"
#            shift 2
#            ;;
#        -o|--output)
#            OUT_FILE="$2"
#            shift 2
#            ;;
#        --debug) # Argument acting as a simple flag
#            DEBUG=1
#            shift 1
#            ;;
#        *)
#            break
#            ;;
#    esac
#done
#
## Some simple argument checks
#wrong_arg() {
#    echo "Error: invalid value for $1" >&2
#    exit 2
#}
#
#[ -f $IN_FILE ] || wrong_arg "input file"
#[ -f $OUT_FILE ] || wrong_arg "output file"
#
## The actual script can start below
## ...