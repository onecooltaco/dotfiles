#!/usr/bin/env bash
#
# !!! DO NOT EDIT !!!
# Managed by Puppet
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

#Load in .profile -------------------------------------------------
[[ -s ~/.profile ]] && source ~/.profile

# Load .bashrc ----------------------------------------------------
[[ -s ~/.bashrc ]] && source ~/.bashrc