# Paths
# export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:~/go/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"


# Plugins
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

# Aliases
# alias brewdump="brew bundle dump --file ~/dotfiles/Brewfile -f"
# alias brewinstall="brew bundle install --file ~/dotfiles/Brewfile"

# Docker/Colima
# export DOCKER_HOST="unix://$HOME/.colima/default/docker.sock"
# export DOCKER_CONFIG=/opt/homebrew/lib/docker
export PATH="$HOME/.local/bin:$PATH"
