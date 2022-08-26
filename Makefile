reporoot := $(strip $(shell dirname "$(realpath $(lastword $(MAKEFILE_LIST)))"))
XDG_HOME_CONFIG ?= ${HOME}/.config

$(XDG_HOME_CONFIG)/git/config: $(reporoot)/git/config

