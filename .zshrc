HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias vim=nvim
alias ll="ls -alh"
alias notes="vim ~/Dropbox/notes.md"
alias notes:temp="vim ~/temp/temp"                                                           

export XDG_CONFIG_HOME="$HOME/.config"
export TERMINAL="kitty"
export EDITOR="nvim"
export BROWSER="firefox-developer-edition"

fpath=( "$HOME/.zsh/prompts/" $fpath)

autoload -Uz compinit
compinit

autoload -U promptinit; promptinit
prompt spaceship

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# plugins
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/plugins/zsh-z/zsh-z.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

if [[ "$(tty)" = "/dev/tty1" ]]; then
	 startx
fi

source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

neofetch
