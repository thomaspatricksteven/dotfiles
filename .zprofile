# Environment variables

export TERMINAL="alacritty"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox-developer-edition"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME="$HOME/.cache"
export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/history"
export GOPATH="$HOME/.local/go"
export GOBIN="$GOPATH/bin"
export PATH=~/.local/bin:$PATH
export PATH="$HOME/.poetry/bin:$PATH"
export PATH="$GOBIN:$PATH"
export CGO_ENABLED=0 # seems to be needed for go/lambda/amplify

source $XDG_CONFIG_HOME/zsh/icons.zsh
source $XDG_CONFIG_HOME/zsh/aliases.zsh

[[ -n "$(tty)" && -z $(pgrep -u $USER "\bXorg$") ]] && exec startx

