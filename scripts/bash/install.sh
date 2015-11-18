#!/usr/bin/env bash

# Common functions
function install_file {
    ln -sf "$DOT_FILES_PATH/$1" "$2"
}

function ensure_directory_exists {
    if [ ! -e "$1" ]; then
        echo "Preparing $1 directory"
        mkdir -p "$1"
    fi
}

echo "Installing dot files"

CONFIG_BACKUP_DIRECTORY="$HOME/.dot-files-backup"
DOT_FILES_PATH="$HOME/.dot-files"
TMUX_CONFIG_PATH="$HOME/.tmux.conf"
TMUX_CONFIG_SOURCE="tmux.conf"

# Install dot-files
if [ ! -e "$DOT_FILES_PATH" ]; then
    echo "Installing dot-files"
    mkdir -p "$DOT_FILES_PATH"
    git clone -b master https://github.com/alxbrd/dot-files.git "$DOT_FILES_PATH"
else
    echo "Updating dot-files"
    cd "$DOT_FILES_PATH" && git pull origin master
fi

# Prepare installation directories
ensure_directory_exists $CONFIG_BACKUP_DIRECTORY

# Install files
install_file $TMUX_CONFIG_SOURCE $TMUX_CONFIG_PATH



