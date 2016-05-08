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

# * ~/.bashrc_local can be used for other settings you don’t want to commit elsewhere.
[[ -s ~/.bashrc_local ]] && source ~/.bashrc_local

