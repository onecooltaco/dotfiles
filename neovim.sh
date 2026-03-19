#!/usr/bin/env bash
set -eu

ROOT_DIR="$(dirname -- "$(stat -f "$0")")"

# Install neovim if needed
if test ! "$(which neovim)"; then
  echo "Installing neovim..."
  brew install neovim
fi

# Install VimR if needed
if ! mdfind -name 'VimR.app' &>/dev/null; then
  brew install --cask vimr
  #brew install vv
fi

mkdir -p "${HOME}/.config/nvim"

[[ -f ${HOME}/.config/nvim/init.vim ]] && cp "${HOME}/.init.vim"{,~}
cp -f "${ROOT_DIR}/nvim-init.vim" "${HOME}//.config/nvim/init.vim"
