source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/functions.zsh
source ~/.config/zsh/z.zsh

source $HOME/.asdf/asdf.sh
source ~/.fzf.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/gitit/gitit.zsh
source ~/.zsh/plugins/vmi-counter

fpath=(${ASDF_DIR}/completions $fpath)

stty stop undef		# Disable ctrl-s to freeze terminal.

bindkey -e # emacs mode

# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/history
setopt appendhistory
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# prompt
NEWLINE=$'\n'
PROMPT='${NEWLINE}%(?..😿 %F{red}%?%f${NEWLINE})%F{green}%n%f in %F{blue}%~%f $vcs_info_msg_0_ %f${NEWLINE}-> '
#PROMPT='${NEWLINE}%(?..😿 %F{red}%?%f${NEWLINE})%F{green}🎄 in %F{blue}%~%f %f${NEWLINE}-> '

#git prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats 'on %F{yellow}%b '
zstyle ':vcs_info:*' enable git

setxkbmap -model 'pc104curl-z' -layout 'us(cmk_ed_us)' -option 'caps:escape,misc:cmk_curl_dh'

export FZF_DEFAULT_OPTS='
  --bind ctrl-f:page-down,ctrl-b:page-up
  --color=fg:#a8a8a8,bg:#1c1c1c,hl:#5f8700
  --color=fg+:#afaf5f,bg+:#1c1c1c,hl+:#d78700
  --color=info:#87afd7,prompt:#87afd7,pointer:#d78700
  --color=marker:#d78700,spinner:#875f87,header:#875f87'

# logo


# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
