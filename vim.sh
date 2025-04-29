#!/usr/bin/env bash
set -eu

ROOT_DIR="$(dirname -- "$(stat -f "$0")")"

if ! mdfind -name 'MacVim.app' &>/dev/null; then
  brew install --cask macvim
fi

for f in gvimrc vimrc; do
	[[ -f ${HOME}/.${f} ]] && cp "${HOME}/.${f}"{,~}
	cp -f "${ROOT_DIR}/${f}" "${HOME}/.${f}"
done

for d in backups swaps pack/plugins/start; do
  mkdir -p "${HOME}/.vim/${d}"
done

plugins_array=("catppuccin/vim" "aklt/plantuml-syntax" "editorconfig/editorconfig-vim" "hashivim/vim-terraform")

for p in "${plugins_array[@]}"; do
  dir="${HOME}/.vim/pack/plugins/start/${p//\//_}"
  if [ ! -d "$dir" ]; then
    echo "downloading Vim Plugin ${p}..."
    git clone "https://github.com/${p}.git" "$dir"
  else
    echo "Vim Plugin $p already installed."
  fi
done
