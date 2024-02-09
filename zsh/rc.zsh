source_if_exists() {
    if test -r "$1"; then
        source "$1"
    fi
}

autoload -Uz compinit && compinit

source_if_exists $HOME/.env.sh
source_if_exists /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source_if_exists /opt/homebrew/opt/chruby/share/chruby/auto.sh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists $DOTFILES/zsh/history.zsh
source_if_exists $HOME/.fzf.zsh
source_if_exists $DOTFILES/dependencies/fzf-tab/fzf-tab.plugin.zsh

# Starship
eval "$(starship init zsh)"

# neovim
export XDG_CONFIG_HOME="$HOME/.config"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'

# Allows pressign up arrow to search history with fzf
bindkey "^[[A" fzf-history-widget

export BAT_THEME="TwoDark"
