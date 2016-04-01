#!/usr/bin/env bash

set -e

if [ -L ~/.vimrc ]; then
    echo "There's no need to create vimrc symbolic link"
elif [ -f ~/.vimrc ]; then
    echo "Warning: ~/.vimrc already exists"
    exit 0
else
    ln -s ~/.vim/vimrc ~/.vimrc
    echo "Create a symbolic link to ~/.vimrc"
fi
vim -c ':BundleInstall'
