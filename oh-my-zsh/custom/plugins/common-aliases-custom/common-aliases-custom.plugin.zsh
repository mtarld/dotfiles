alias ll='ls -lAh'

# Tmux
alias mux='tmuxinator'
alias ta='tmux a'
alias te='tmuxinator edit'
alias tls='tmux ls'
alias tn='tmuxinator new'
alias ts='tmuxinator start'
alias tk='tmux kill-session -t'

# Xclip
alias xc='xclip -selection c'

alias slugify='f(){echo $1 | iconv -t ascii//TRANSLIT | sed -r s/\[~\^\\]//g | sed -r s/\[^a-zA-Z0-9\]+/-/g | sed -r s/^-+\|-+$//g | tr A-Z a-z};f'
alias s='symfony'
alias sc='symfony console'

# Misc
alias weather='curl -s wttr.in | tail -32 | head -30'

# Nvim
alias nvimsync="nvim +'hi NormalFloat guibg=#1e222a' +PackerSync"

# Docker
alias docker-killall='docker container kill $(docker ps -q)'
