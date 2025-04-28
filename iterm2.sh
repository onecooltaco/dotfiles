#!/usr/bin/env bash
set -eu

temp_dir=$(mktemp -d)
trap exiting exit
function exiting() { rm -rf ${temp_dir}; exit; }

if [[ ! -f "$HOME/.iterm2_shell_integration.zsh" ]]; then
  curl -L https://iterm2.com/shell_integration/install_shell_integration.sh | bash
fi

mkdir $temp_dir/schemes
mkdir $temp_dir/tools
curl -Ls https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/tools/import-scheme.sh > $temp_dir/tools/import-scheme.sh

catppuccin_array=("frappe" "latte" "macchiato" "mocha")

for f in "${catppuccin_array[@]}"
do
  echo "downloading catppuccin-${f}.itermcolors file..."
  curl -Ls https://raw.githubusercontent.com/catppuccin/iterm/main/colors/catppuccin-${f}.itermcolors > $temp_dir/schemes/catppuccin-${f}.itermcolors
  echo "Processing catppuccin-${f}.itermcolors file..."
  # Import file $f
  sh $temp_dir/tools/import-scheme.sh catppuccin-${f}.itermcolors
done
