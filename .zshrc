# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

alias vim=nvim
alias ll="ls -Alh"
alias ls="lsd"
alias cat="bat"
alias notes="vim ~/Dropbox/notes.md"
alias notes:temp="vim ~/temp/temp" 
alias icat="kitty +kitten icat"
alias dc="docker-compose"
alias open="xdg-open"

alias logo="pixcat thumbnail --size 128 --align left tom_logo.png"
alias big-logo="pixcat thumbnail --size 256 --align left tom_logo.png"

alias humi="cd ~/code/humility"
alias ui="cd ~/code/humility/applications/ui"
alias hr="cd ~/code/humility/applications/hr"
alias payroll="cd ~/code/humility/applications/payroll"
alias admin="cd ~/code/humility/applications/admin"

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
export PATH="$HOME/.cargo/bin:$PATH"

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
source ~/.config/lf/lfcd.sh

if [[ "$(tty)" = "/dev/tty1" ]]; then
	 startx
 else
fi

# prompt
NEWLINE=$'\n'
PROMPT='${NEWLINE}%(?..😿 %F{red}%?%f${NEWLINE})%F{green}%n%f in %F{blue}%~%f $vcs_info_msg_0_ %f${NEWLINE}-> '

#git prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats 'on %F{yellow}%b '
zstyle ':vcs_info:*' enable git

printf "\n\n"
logo
#big-logo
