#!/usr/bin/env bash

echo "Creating directories"
mkdir -p ~/.config/nvim
mkdir -p ~/.vim/undodir

echo "Linking configuration"
ln -s $(pwd)/init.vim ~/.config/nvim/init.vim

echo "Done"
