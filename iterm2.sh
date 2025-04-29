#!/usr/bin/env bash
set -eu

ROOT_DIR="$(dirname -- "$(stat -f "$0")")"
TEMP_DIR=$(mktemp -d)
trap exiting exit
function exiting() { rm -rf "$TEMP_DIR"; exit; }

if ! mdfind -name 'iTerm.app' &>/dev/null; then
  brew install --cask iterm2
fi

mkdir "${TEMP_DIR}/schemes"
mkdir "${TEMP_DIR}/tools"
curl -Ls https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/tools/import-scheme.sh > "${TEMP_DIR}/tools/import-scheme.sh"

catppuccin_array=("frappe" "latte" "macchiato" "mocha")

for f in "${catppuccin_array[@]}"
do
  echo "downloading catppuccin-${f}.itermcolors file..."
  curl -Ls "https://raw.githubusercontent.com/catppuccin/iterm/main/colors/catppuccin-${f}.itermcolors" > "${TEMP_DIR}/schemes/catppuccin-${f}.itermcolors"
  echo "Processing catppuccin-${f}.itermcolors file..."
  # Import file $f
  sh "${TEMP_DIR}/tools/import-scheme.sh catppuccin-${f}.itermcolors"
done

defaults write com.googlecode.iterm2 QuitWhenAllWindowsClosed -bool true
cp -f "${ROOT_DIR}/iterm-profiles.json" "${HOME}/Library/Application\ Support/iTerm2/DynamicProfiles/"
