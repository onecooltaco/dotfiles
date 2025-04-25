#!/usr/bin/env bash
set -eu

mkdir -p ~/.vim/backups
mkdir -p ~/.vim/swaps
mkdir -p ~/.vim/pack/plugins/start

git clone https://github.com/catppuccin/vim.git ~/.vim/pack/plugins/start/catppuccin-vim
git clone https://github.com/aklt/plantuml-syntax.git ~/.vim/pack/plugins/start/plantuml-syntax
git clone https://github.com/editorconfig/editorconfig-vim.git ~/.vim/pack/local/start/editorconfig-vim
git clone https://github.com/hashivim/vim-terraform.git ~/.vim/pack/plugins/start/vim-terraform
