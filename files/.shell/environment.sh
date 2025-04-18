# {{{ Important applications
export EDITOR=vim
# }}}

#ccache -s
#ccache -M 10G
set use_ccache=true
set CCACHE_DIR="$HOME/.ccache"

[[ -z $HOSTNAME ]] && export HOSTNAME="$(hostname -s)"
[[ -z $DOMAINNAME ]] && export DOMAINNAME="$(hostname -d)"

# {{{ Language settings
export LANG="en_US.utf8"
# }}}

# {{{ Default permissions on newly created files and directories
umask 027  # g-w,o-rwx
umask 022  # g-w,o-w
# }}}

mesg n     # Disable write-messages

# {{{ Terminal settings
[[ "$COLORTERM" == "gnome-terminal" ]] && export TERM="gnome-256color"
case "${TERM}" in
    xterm*)
        export TERM=xterm-256color
        ;;
    screen)
        export TERM=screen-256color
        ;;
    dumb)
        ;;
    *)
        ;;
esac

if [ -n "$XTERM" ]; then
    stty -ixon

    # Check the color support of the current terminal. Always use this for color
    # related things, or shit might blow up
    C=$(tput colors)
    # }}}
fi

for add_path in /bin /sbin /usr/bin /usr/sbin /usr/local/bin /usr/local/sbin
do
    if ! echo $PATH |egrep "(^|:)${add_path}(:|$)" &>/dev/null
    then
        export ORD_PATH="$ORD_PATH:$add_path"
    fi
done

for add_path in $HOME/bin $HOME/opt/bin
do
    if ! echo $PATH |egrep "(^|:)${add_path}(:|$)" &>/dev/null
    then
        export HOME_PATH="$HOME_PATH:$add_path"
    fi
done

export GOPATH=$HOME/gocode
mkdir -p $GOPATH

PATH=$(echo "$HOME_PATH:$PATH:$ORD_PATH" | sed -e 's|::|:|; s|:$||; s|^:||')
unset ORD_PATH
unset HOME_PATH

if [[ -d /usr/lib/ccache ]]; then
    PATH="/usr/lib/ccache:$PATH"
fi
if [[ -d ${HOME}/.local/bin ]]; then
    PATH="$HOME/.local/bin/:$PATH"
fi

if [[ -d ${GOPATH}/bin ]]; then
    PATH="$GOPATH/bin:$PATH"
fi

export PATH

# }}}

## Colors for 'ls'
for dircolors_file in "$HOME/.dir_colors" "/etc/DIR_COLORS"; do
    [[ -e "$dircolors_file" ]] && dircolors_used="$dircolors_file" && break
done

dircolors_output=$(dircolors -b "$dircolors_used" 2>&1)

if [ $? -ne 0 ]; then
    cp $(readlink -f "$dircolors_used") /tmp/dircolors.$$.tmp
    for unsupported_keyword in $(dircolors -b "$dircolors_used" 2>&1 | sed -e 's|.*unrecognized\ keyword\ \([A-Z0-9]\+\).*|\1|'); do
        sed -i -e "/$unsupported_keyword/d" /tmp/dircolors.$$.tmp
    done
    dircolors_output=$(dircolors -b /tmp/dircolors.$$.tmp)
    rm /tmp/dircolors.$$.tmp
fi
eval $dircolors_output

# SSH pubkey auth keychain
if [[ -f $HOME/.ssh/id_rsa && -x /usr/bin/keychain ]]; then
    eval $(/usr/bin/keychain -q --eval $HOME/.ssh/id_rsa)
fi

# Virtualenvwrapper
if [ -x /usr/local/bin/virtualenvwrapper.sh ]
then
    . /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f "$HOME/.environment.local" ]; then
    source "$HOME/.environment.local"
fi

if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi
##############################################################################
# vim: expandtab tabstop=4 shiftwidth=4 softtabstop=4                        :
