# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Variables
export PATH="$PATH:$HOME/bin"
export EDITOR="nvim"

# Plugin Manager Zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Theme
zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


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

# tmux
alias tka="tmux kill-session -a"
alias tks="tmux kill-session -t"
alias tksa="tmux kill-server"
alias ta="tmux attach -t"
alias tl="tmux ls"
alias tas="tmux attach -s"
alias tns="tmux new -s"

# Neofetch
neofetch