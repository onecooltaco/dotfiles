#!/usr/bin/env bash
#
##  .bash_profile is for making sure that both the things in .profile and .bashrc
##  are loaded for login shells.

# Notes: ----------------------------------------------------------
# When you start an interactive shell (log in, open terminal or iTerm in OS X,
# or create a new tab in iTerm) the following files are read and run, in this order:
# profile
# bashrc
# .bash_profile
# .bashrc (only because this file is run (sourced) in .bash_profile)
#
# When an interactive shell, that is not a login shell, is started
# (when you run "bash" from inside a shell, or when you start a shell in
# xwindows [xterm/gnome-terminal/etc] ) the following files are read and executed,
# in this order:
# bashrc
# .bashrc

OS=`uname`

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;

# Set the prompt in color
export PS1="\[\e[0;31m\]\u\[\e[0m\]@\[\e[0;32m\]\h\[\e[0m\]:\[\e[0;34m\]\w\[\e[0m\]\$ "

## Prepare the ls color options
export CLICOLOR=1
if [[ "$OS" = "Linux" ]]; then
	for file in /etc/DIR_COLORS ~/.dir_colors; do
		if [[ -f "$file" ]]; then
		  eval `dircolors -b $file`
		fi
	done
	export LS_OPTIONS='--color=auto'
fi

if [ -x /usr/bin/lesspipe ]; then
	eval `lesspipe`
fi

# PATH SETTINGS ---------------------------------------------------------------
# Ensure user-installed binaries take precedence
[ -d "/usr/local/bin" ]  && PATH=/usr/local/bin:$PATH
[ -d "/usr/local/sbin" ]  && PATH=/usr/local/sbin:$PATH
# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ]  && PATH="$HOME/bin:$PATH"

export PATH

##
## Completion…
##

# Shell Completion ------------------------------------------------------------
complete -d cd
complete -A command sudo

# bash completion.
if  [ -f "$(brew --prefix 2>/dev/null)/etc/bash_completion" ]; then
    source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;

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
# No duplicate entries.
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE="pwd:exit:date:clear:history"

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

# Misc ------------------------------------------------------------------------
if [[ "$OS" = "Darwin" ]]; then
  if [[ "$(sw_vers -productVersion)" == 10.6.* ]]; then
    export ARCHFLAGS="-arch i386 -arch x86_64"
  else
	export ARCHFLAGS="-arch x86_64"
  fi
fi

# Bring in the other files ----------------------------------------------------
[[ -s ~/.bash_prompt_settings ]] && source ~/.bash_prompt_settings
[[ -s ~/.bash_aliases ]] && source ~/.bash_aliases

#Load in .profile -------------------------------------------------
[[ -s ~/.profile ]] && source ~/.profile

# Load .bashrc ----------------------------------------------------
[[ -s ~/.bashrc ]] && source ~/.bashrc
