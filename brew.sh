#!/usr/bin/env bash
set -eu

# Check for Homebrew,
# Install if needed
if test ! "$(which brew)"; then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update brew packages
brew update
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

brew install bash-completion
# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install `wget`.
brew install wget

brew install lynx
brew install nmap
brew install rename
brew install ssh-copy-id
brew install tree
brew install dos2unix
brew install duti
brew install awscli
brew install jq
brew install gh
brew install pre-commit
brew install zsh-completions
brew install zsh-syntax-highlighting

# Remove outdated versions from the cellar.
brew cleanup
