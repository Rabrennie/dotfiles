source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

autoload -Uz compinit && compinit

source_if_exists $HOME/.env.sh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists $HOME/.fzf.zsh
source_if_exists $DOTFILES/dependencies/fzf-tab/fzf-tab.plugin.zsh

# Starship
eval "$(starship init zsh)"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
