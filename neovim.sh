#!/usr/bin/env bash
set -eu

ROOT_DIR="$(dirname -- "$(stat -f "$0")")"

# Install neovim if needed
if test ! "$(which nvim)"; then
  echo "Installing neovim..."
  brew install neovim
fi

# Install VimR if needed
if ! mdfind -name 'VimR.app' &>/dev/null; then
  brew install --cask vimr
  #brew install vv
fi

mkdir -p "${HOME}/.config/nvim"

[[ -f ${HOME}/.config/nvim/init.vim ]] && mv "${HOME}/.config/nvim/init.vim"{,~}
[[ -f ${HOME}/.config/nvim/init.lua ]] && cp "${HOME}/.config/nvim/init.lua"{,~}
cp -f "${ROOT_DIR}/nvim-init.lua" "${HOME}/.config/nvim/init.lua"
