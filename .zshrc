# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

alias vim=nvim
alias ll="ls -alh"
alias notes="vim ~/Dropbox/notes.md"
alias notes:temp="vim ~/temp/temp"                                                           

# Recent commits 
function g-recent {
    readonly hours=${1:?"The hours must be specified."}
    git rev-list --no-merges HEAD --not $(git rev-list -n1 --before="${hours} hours" --first-parent HEAD) --pretty
}

# function command_not_found_handler {
#   echo "hey!"
#   echo "$@"
#   return 127
# }

export XDG_CONFIG_HOME="$HOME/.config"
export TERMINAL="kitty"
export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="firefox-developer-edition"
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export PATH=~/.local/bin:$PATH

# vi mode
bindkey -v
export KEYTIMEOUT=1

autoload -Uz compinit
compinit

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

# plugins
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.zsh/plugins/zsh-z/zsh-z.plugin.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

if [[ "$(tty)" = "/dev/tty1" ]]; then
	 startx
 else
fi

# If terminal emulator
if [[ "$(tty)" = *"pts"* ]];then
   # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
   # Initialization code that may require console input (password prompts, [y/n]
   # confirmations, etc.) must go above this block, everything else may go below.
   if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
   fi

   source ~/.zsh/plugins/powerlevel10k/powerlevel10k.zsh-theme
   # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
   [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

pfetch
