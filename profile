#!/usr/bin/env bash
#
# !!! DO NOT EDIT !!!
# Managed by Puppet
#
##  .profile is for things that are not specifically related to Bash, like environment
##  variables PATH and friends, and should be available anytime. For example,
##  .profile should also be loaded when starting a graphical desktop session.

OS=`uname`

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

if [ -x /usr/bin/lesspipe ]; then
	eval `lesspipe`
fi

# PATH SETTINGS ---------------------------------------------------------------
[ -d "/usr/local/sbin" ]  && PATH=/usr/local/sbin:$PATH
# set PATH so it includes user's private bin if it exists
[ -d "$HOME/bin" ]  && PATH="$HOME/bin:$PATH"

export PATH

# * ~/.profile_local can be used for other settings you don’t want to commit elsewhere.
[[ -f ${HOME}/.profile_local ]] && source ${HOME}/.profile_local
