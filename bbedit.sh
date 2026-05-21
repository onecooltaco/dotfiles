#!/usr/bin/env bash
set -eu

# Install module I use BBREdit.

DIR="${HOME}/Library/Application Support/BBEdit/Language Modules"
# Check for library directory
# Create if needed
if [[ ! -d $DIR ]]; then
    mkdir -p "$DIR"
fi

# Terraform Language Module
curl https://raw.githubusercontent.com/halprin/terraform-bbedit-language/master/Terraform.plist > "$DIR/Terraform.plist"

# Apache Configuration Language Module
curl -L http://daringfireball.net/projects/downloads/Apache_Configuration_1.0.7.zip | bsdtar -xvf- -C "$DIR/"

# BBColors color scheme file Language Module
curl -L http://daringfireball.net/projects/downloads/BBColors_Scheme_CLM.zip | bsdtar -xvf- -C "$DIR/"

# diff Language Module
curl -L https://pudge.net/bbedit/Diff.plist > "$DIR/Diff.plist"

# git blame Language Module
curl -L https://pudge.net/bbedit/GitBlame.plist > "$DIR/GitBlame.plist"
