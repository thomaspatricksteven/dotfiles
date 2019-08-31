precmd() {echo $(pwd) > ~/.whereami}

export ZSH="/home/tom/.oh-my-zsh"

#ZSH_THEME="spaceship"

plugins=(git wd node)

source $ZSH/oh-my-zsh.sh

alias ll="ls -alh"
alias :q="exit"
alias hello="echo Hello, $USER!"
alias notes="vim ~/Dropbox/notes.md"
alias notes:temp="vim ~/temp/temp"
alias fresh="cd /home/tom/code/humi/application && ./fresh && cd -"
alias vim="nvim"
alias okay="echo Hello, $USER"
alias mouseoff="xinput disable 'TPPS/2 IBM TrackPoint'"
alias mouseon="xinput enable 'TPPS/2 IBM TrackPoint'"
alias touchpadoff="xinput disable 'Synaptics TM3276-031'"
alias touchpadon="xinput enable 'Synaptics TM3276-031'"

export VISUAL=vim
export EDITOR="$VISUAL"
export LANG=en_US.UTF-8
export PROMPT_COMMAND="pwd > ~/.whereami"
  . $HOME/.asdf/asdf.sh

  . $HOME/.asdf/completions/asdf.bash

  powerline-daemon -q
  . /usr/lib/python3.7/site-packages/powerline/bindings/zsh/powerline.zsh

cd $(cat ~/.whereami)

