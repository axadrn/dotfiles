# Paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:~/go/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"


# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(starship init zsh)"

# Aliases
alias brewdump="brew bundle dump --file ~/dotfiles/Brewfile -f"
alias brewinstall="brew bundle install --file ~/dotfiles/Brewfile"

