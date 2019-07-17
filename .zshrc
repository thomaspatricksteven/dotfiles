export ZSH="/home/tom/.oh-my-zsh"

ZSH_THEME="spaceship"

# tmux
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

plugins=(git wd vi-mode node)

source $ZSH/oh-my-zsh.sh

alias ll="ls -alh"
alias :q="exit"
alias hello="echo Hello, $USER!"
alias journal="vim ~/Dropbox/programming_journal.md"
alias notes="vim ~/Dropbox/notes.md"
alias whereami="pwd"

export VISUAL=vim
export EDITOR="$VISUAL"
export TERM=xterm-256color
export LANG=en_US.UTF-8

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

