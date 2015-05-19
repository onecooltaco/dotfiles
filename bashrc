#!/usr/bin/env bash
#
##  .bashrc is for the configuring the interactive Bash usage, like Bash aliases,
##  setting your favorite editor, setting the Bash prompt, etc.


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
  # Shell is non-interactive.  Be done now!
  return
fi

OS=`uname`

[ -d "/usr/local/bin" -a $PATH = "*local/bin*" ] || PATH=$PATH:/usr/local/bin
export PATH

# Shell Completion ------------------------------------------------------------
complete -d cd
complete -A command sudo

[[ -s /etc/bash_completion ]] && source /etc/bash_completion
[[ -s /opt/local/etc/bash_completion ]] && source /opt/local/etc/bash_completion
[[ -s /usr/local/etc/bash_completion ]] && source /usr/local/etc/bash_completion

# Shell Look and Feel ---------------------------------------------------------
shopt -s extglob
shopt -s checkwinsize

# Prevent overwriting files by mistake
set -C noclobber

# Shell History ---------------------------------------------------------------
shopt -s histappend
shopt -s cmdhist
HISTSIZE=16384
HISTFILESIZE=32768
HISTTIMEFORMAT='%F %T%t'
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="pwd:exit:date:clear:history"

#
# Setup Grep
#
export GREP_OPTIONS=

# Ignore certain directory patterns
if echo hello | grep --exclude-dir=. hello &> /dev/null 2>&1; then
	export GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
	export GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
	export GREP_OPTIONS="--exclude-dir=CVS $GREP_OPTIONS"
elif echo hello | grep --exclude=. hello &> /dev/null 2>&1; then
	export GREP_OPTIONS="--exclude=\*.svn\* $GREP_OPTIONS"
	export GREP_OPTIONS="--exclude=\*.git\* $GREP_OPTIONS"
# would like to exclude CVS here, but it's too generic without slashes
fi

# Turn on grep colorization
if echo hello | grep --color=auto hello &>/dev/null 2>&1; then
	export GREP_OPTIONS="--color=auto $GREP_OPTIONS"
	export GREP_COLOR='0;32'
fi

# Prepare the ls color options
if [[ "$OS" = "Darwin" ]]; then
	export CLICOLOR=1
	export TERM=xterm-color
else
	for file in /etc/DIR_COLORS ~/.dir_colors; do
		if [[ -f "$file" ]]; then
		  eval `dircolors -b $file`
		fi
	done
	export LS_OPTIONS='--color=auto'
fi

# Editors ---------------------------------------------------------------------
# Make vim the default editor
export EDITOR='vim'
export GIT_EDITOR='vim'
# Preferred pager
export PAGER=less
# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
# Highlight section titles in manual pages
export LESS_TERMCAP_md="$ORANGE"

# Aliases ---------------------------------------------------------------------
# Make some possibly destructive commands more interactive.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Shortcut for using the Kdiff3 tool for svn diffs.
alias svnkdiff3='svn diff --diff-cmd kdiff3'

alias screen="screen -U"

# Enable aliases to be sudo’ed
alias sudo='sudo '

[[ -x /usr/libexec/PlistBuddy ]] && alias plistbuddy="/usr/libexec/PlistBuddy"

# Misc ------------------------------------------------------------------------
if [[ "$OS" = "Darwin" ]]; then
  if [[ "$(sw_vers -productVersion)" == 10.6.* ]]; then
    export ARCHFLAGS="-arch i386 -arch x86_64"
  else
	export ARCHFLAGS="-arch x86_64"
  fi
fi

# Bring in the other files ----------------------------------------------------
[[ -s /etc/bash_completion ]] && source /etc/bash_completion
[[ -s ~/.bash_prompt_settings ]] && source ~/.bash_prompt_settings
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases
## Homebrew formulae bash completion.
if which brew > /dev/null; then
  if [ -s $(brew --prefix)/etc/bash_completion.d -a "$(ls -A $(brew --prefix)/etc/bash_completion.d)" ]; then
    source $(brew --prefix)/etc/bash_completion.d/*
  fi
fi

# * ~/.bashrc_local can be used for other settings you don’t want to commit elsewhere.
[[ -s ~/.bashrc_local ]] && source ~/.bashrc_local

