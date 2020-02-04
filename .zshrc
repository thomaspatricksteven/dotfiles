# history
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
export VISUAL="nvim"
export BROWSER="firefox-developer-edition"

# vi mode
bindkey -v
export KEYTIMEOUT=1

autoload -Uz compinit
compinit

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
