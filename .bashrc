#!/bin/bash

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

alias ls="exa --group-directories-first --icons --color-scale"
alias ll="ls -ali --git"

alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir='mkdir -vp'
alias rm='rm -v'

alias vim=nvim
alias cat="bat"
alias notes="vim ~/Dropbox/notes.md"
alias dc="docker-compose"
alias open="xdg-open"
alias wd="word-define"

alias humi="cd ~/code/humility"
alias ui="cd ~/code/humility/applications/ui"
alias hr="cd ~/code/humility/applications/hr"
alias payroll="cd ~/code/humility/applications/payroll"
alias admin="cd ~/code/humility/applications/admin"

TERMINAL=alacritty
EDITOR=nvim
VISUAL=nvim
BROWSER=firefox-developer-edition
XDG_CONFIG_HOME="$HOME/.config"
XDG_DATA_HOME="$HOME/.local/share"
XDG_CACHE_HOME="$HOME/.cache"
GOPATH="$HOME/.local/go"
GOBIN="$GOPATH/bin"
PATH="$HOME/.local/bin:$PATH"
PATH="$GOBIN:$PATH"
PATH="$HOME/.asdf/installs/nodejs/15.13.0/.npm:$PATH"
HISTFILESIZE=-1

