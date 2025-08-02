#rPaths
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$PATH:~/go/bin
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

# Prompt - <PROMPT_SUBST> allowa commands in prompt
setopt PROMPT_SUBST 
PROMPT=$'\n%~ %F{yellow}$(git branch 2>/dev/null | grep "*" | cut -d " " -f2)%f %F{red}❯%f '

# Neovim Switcher
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
function nvims() {
  items=("default" "AstroNvim" "LazyVim")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Kanata aliases
alias kanata-start='sudo -b kanata -c ~/.config/kanata/home_row.kbd'
alias kanata-stop='sudo pkill kanata'
alias kanata-restart='kanata-stop && kanata-start'
alias kanata-status='pgrep -l kanata'
