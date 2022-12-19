# Sourcing stuff...
BASH=$HOME/.bash
SH=$HOME/.shell

source $SH/environment.sh
source $SH/aliases.sh
source $SH/functions.sh

source $BASH/functions.sh
source $BASH/prompt.sh

[[ -f $HOME/.bashrc.local ]] && source "$HOME/.bashrc.local"

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now
	return
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# uncomment the following to activate bash-completion:
[[ -f /etc/profile.d/bash-completion ]] && source /etc/profile.d/bash-completion

##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
