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
alias locale2e="./node_modules/cypress/bin/cypress open --config baseUrl=http://localhost:4200 --env apiUrl=http://hr.localhost --project=e2e"

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

