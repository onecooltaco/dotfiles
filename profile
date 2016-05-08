#!/usr/bin/env bash
#
##  .profile is for things that are not specifically related to Bash, like environment
##  variables PATH and friends, and should be available anytime. For example,
##  .profile should also be loaded when starting a graphical desktop session.

# * ~/.profile_local can be used for other settings you don’t want to commit elsewhere.
[ -f "${HOME}/.profile_local" ] && source ${HOME}/.profile_local

