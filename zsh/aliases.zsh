alias ls='eza'
alias ll='eza -lah'

alias sz="source $HOME/.zshrc"

alias vim="nvim"

alias vdot='cd "$DOTFILES" && nvim .'

alias drestart="curl -X POST -H 'Content-Type: application/json' -d '{ \"openContainerView\": false }' -kiv --unix-socket ~/Library/Containers/com.docker.docker/Data/backend.sock http://localhost/engine/restart"
