precmd() {echo $(pwd) > ~/.whereami}

export ZSH="/home/tom/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(git wd node)

source $ZSH/oh-my-zsh.sh

alias ll="ls -alh"
alias :q="exit"
alias hello="echo Hello, $USER!"
alias journal="vim ~/Dropbox/programming_journal.md"
alias notes="vim ~/Dropbox/notes.md"
alias vim="nvim"
alias whereami="pwd"

export VISUAL=vim
export EDITOR="$VISUAL"
export TERM=xterm-256color
export LANG=en_US.UTF-8
export PROMPT_COMMAND="pwd > ~/.whereami"
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

cd $(cat ~/.whereami)
