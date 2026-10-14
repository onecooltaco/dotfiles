# Jeremy's dotfiles

Personal macOS shell, editor, Git, Homebrew, and application configuration.

This repository is public for reference and repeatable workstation setup. It is intentionally opinionated and includes personal defaults; it is not a universal bootstrap script.

## What's included

- Zsh and Bash startup configuration
- Git defaults, global ignore rules, commit-message template, and repository templates
- Vim, MacVim, and Neovim setup
- Homebrew workstation and development-tool installers
- iTerm2 profiles and color-scheme setup
- BBEdit helpers
- macOS defaults and application associations

## Before using it

Read every script before running it. Some scripts:

- install or upgrade packages;
- copy files into your home directory and back up existing files with a `~` suffix;
- change global Git and macOS settings;
- request administrator privileges;
- download third-party scripts or assets; and
- contain paths or preferences specific to the repository owner.

Fork the repository and replace names, email addresses, absolute paths, application choices, and security-sensitive defaults before using it on another computer.

## Suggested setup order

Run scripts individually rather than treating the repository as a single unattended installer:

1. `brew.sh` — Xcode Command Line Tools, Homebrew, and baseline command-line utilities
2. `brew-devtools.sh` — optional development and infrastructure tools
3. `git.sh` — global Git configuration and pre-commit template setup
4. `vim.sh` or `neovim.sh` — editor configuration
5. `iterm2.sh` and `bbedit.sh` — optional application setup

For example:

```bash
git clone https://github.com/onecooltaco/dotfiles.git
cd dotfiles
less brew.sh
./brew.sh
```

The `osx` script changes many system preferences and uses `sudo`; run it only after reviewing every active setting.

## Configuration files

Files in the repository generally omit the leading dot used in the home directory. The installation scripts copy selected files into place—for example, `gitignore` becomes `~/.gitignore`. Shell startup files are not automatically installed by one top-level bootstrap command, so link or copy only the files you intend to use.

## Updating

Changes can affect interactive shells and global developer tooling. Test updates in a new terminal session, keep a working shell open while changing startup files, and use the backups created by the scripts if a configuration needs to be restored.

## License

No license is currently specified. The repository is available for reference, but that alone does not grant redistribution rights.
