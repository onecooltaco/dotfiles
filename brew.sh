#!/usr/bin/env bash
set -eu

# Check for Homebrew,
# Install if needed
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# update brew packages
brew update
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

brew install bash-completion
# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

brew install lynx
brew install nmap
brew install rename
brew install ssh-copy-id
brew install tree

# Remove outdated versions from the cellar.brew cleanup