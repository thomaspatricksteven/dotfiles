source ~/.config/asdf/asdf.fish

alias ls="exa --group-directories-first --icons --color-scale"
alias ll="ls -ali --git"

alias mv="mv -iv"
alias cp="cp -riv"
alias mkdir='mkdir -vp'
alias rm='rm -v'

alias vim=nvim
alias cat="bat"
alias notes="vim ~/Dropbox/notes.md"
alias dc="docker-compose"
alias open="xdg-open"
alias wd="word-define"

alias humi="cd ~/code/humility"
alias ui="cd ~/code/humility/applications/ui"
alias hr="cd ~/code/humility/applications/hr"
alias payroll="cd ~/code/humility/applications/payroll"
alias admin="cd ~/code/humility/applications/admin"

set -x TERMINAL alacritty
set -x EDITOR nvim
set -x VISUAL nvim
set -x BROWSER firefox-developer-edition
set -x XDG_CONFIG_HOME "$HOME/.config"
set -x XDG_DATA_HOME "$HOME/.local/share"
set -x XDG_CACHE_HOME "$HOME/.cache"
set -x GOPATH "$HOME/.local/go"
set -x GOBIN "$GOPATH/bin"
set -x PATH "$HOME/.local/bin:$PATH"
set -x PATH "$GOBIN:$PATH"
set -x PATH "$HOME/.asdf/installs/nodejs/15.13.0/.npm:$PATH"

set -x CGO_ENABLED

# Start X at login
if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end

