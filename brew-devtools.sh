#!/usr/bin/env bash
set -eu

# Install packages I use for projects via homebrew.

# Check for Homebrew,
# Install if needed
if test ! "$(which brew)"; then
  echo "No homebrew detected!!!"
  echo "Exiting..."
  exit 1
fi

brew install awscli
brew install rclone
brew install s3cmd

brew install jq

brew install gh
brew install pre-commit
brew install repomix

brew install go
brew install lua
brew install node
brew install php
brew install python

brew install black
brew install php-code-sniffer
brew install php-cs-fixer
brew install phpstan
brew install phpunit
brew install prettier
brew install pylint
brew install shellcheck
brew install shellharden
brew install tidy-html5
brew install yamale
brew install yamllint

brew install ansible
brew install ansible-lint

brew install opentofu
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
brew install terraform-docs
brew install terraform-linters/tap/tflint
brew install tfsec
brew install trivy

brew install hadolint
