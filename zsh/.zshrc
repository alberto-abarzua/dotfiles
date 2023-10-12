# Variables
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/bin"

# Theme
ZSH_THEME="bira"

# Plugins
plugins=(git)

# Auto Suggestions
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

source $ZSH/oh-my-zsh.sh

# Python
alias python="python3"
alias pip="pip3"

# Kubernetes
alias get_idf='. $HOME/esp/esp-idf/export.sh'
alias k='kubectl'
kset(){
    kubectl config set-context --current --namespace="$@"
}

# Docker
alias dcr="docker compose run --rm"
alias dcu="docker compose up"
alias dcb="docker compose build"
alias dcd="docker compose down --remove-orphans"

# Check for custom conf in .zshrc.local
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# NeoVim
alias vim="nvim"
alias vi="nvim"

# Neofetch
neofetch

