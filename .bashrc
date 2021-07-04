#!/bin/bash

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash

# alternatives
alias ls='exa --group-directories-first --icons --color-scale'
alias vim=nvim
alias cat=bat

# alias print_pwd='echo $PWD'

# interactive improvements
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir='mkdir -vp'
alias rm='rm -v'
alias ll="ls -ali --git"

# commands
alias termlogo='pixcat thumbnail --size 256 --align left $HOME/Dropbox/tom_on_the_internet/term_logo.png'
alias notes='vim ~/Dropbox/notes.md'
alias wd=word-define

# renames
alias dc="docker-compose"
alias open="xdg-open"

# work
alias humi="cd ~/code/humility"
alias ui="cd ~/code/humility/applications/ui"
alias hr="cd ~/code/humility/applications/hr"
alias payroll="cd ~/code/humility/applications/payroll"
alias admin="cd ~/code/humility/applications/admin"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

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
export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$ "

termlogo
