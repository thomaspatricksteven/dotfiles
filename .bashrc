#!/bin/bash

source $HOME/.asdf/asdf.sh
source $HOME/.asdf/completions/asdf.bash
source /usr/share/fzf/key-bindings.bash
source /usr/share/fzf/completion.bash


# alternatives
alias ls='exa --group-directories-first --icons --color-scale'
alias vim=nvim
alias cat=bat

# interactive improvements
alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir='mkdir -vp'
alias rm='rm -v'
alias ll="ls -ali --git"

# commands
alias termlogo='pixcat thumbnail --size 256 --align left $HOME/Dropbox/tom_on_the_internet/term_logo_transparent.png'
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

export PS1="\u@\h \[\e[32m\]\w \[\e[94m\]\$(parse_git_branch)\[\e[00m\]$ "

termlogo
