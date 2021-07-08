#!/bin/bash

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export -f parse_git_branch
export TERMINAL=alacritty
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=firefox-developer-edition
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GOPATH="$HOME/.local/go"
export GOBIN="$GOPATH/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOBIN:$PATH"
export PATH="$HOME/.asdf/installs/nodejs/15.13.0/.npm:$PATH"
export HISTFILESIZE=-1
export PS1="\u@\h \[\e[32m\]\w \[\e[94m\]\$(parse_git_branch)\[\e[00m\]$ "

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
