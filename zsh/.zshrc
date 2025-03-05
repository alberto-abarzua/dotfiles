# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH="$HOME/.local/bin:$PATH"

# Init completion system
autoload -Uz compinit && compinit

# Deno (JS/TS)
if [ -d "$HOME/.deno" ]; then
    export DENO_INSTALL="$HOME/.deno"
    export PATH="$DENO_INSTALL/bin:$PATH"
    . "/home/alberto/.deno/env"
fi

# Variables
export PATH="$PATH:$HOME/bin"
export EDITOR="nvim"
export XDG_CONFIG_HOME="$HOME/.config"
# export TERM=xterm-256color
export TERM=xterm-kitty

if [ -d "$HOME/.npm-global" ]; then
    export PATH=~/.npm-global/bin:$PATH
fi

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

# tmux
alias tka="tmux kill-session -a"
alias tks="tmux kill-session -t"
alias tksa="tmux kill-server"
alias ta="tmux attach -t"
alias tl="tmux ls"
alias tas="tmux attach -a"
alias tns="tmux new -s"

tn() {
  SESSION_NAME=$(basename $(pwd))
  COMMAND=$1  # Optional command to run
  tmux has-session -t $SESSION_NAME 2>/dev/null

  if [ $? != 0 ]; then
    tmux new-session -s $SESSION_NAME -d

    # If a command was provided, run it in the new session
    if [ ! -z "$COMMAND" ]; then
      tmux send-keys -t $SESSION_NAME "$COMMAND" C-m
    fi
  fi

  tmux attach -t $SESSION_NAME
}


# General -- ls  TODO: replace with exa
alias ll="ls -la --color=auto"
alias la="ls -a --color=auto"
alias lla="ls -la --color=auto"
alias l="ls -CF --color=auto"
alias ls="ls --color=auto"

alias clh="cat /dev/null > ~/.zsh_history"

# General -- clear and neofetch
alias clear="clear && neofetch"
alias cl="clear"

# Go to git repo fast
function g() {
    cd ~/git-local/"$1" || exit
}
function gn() {
    cd ~/git-local/"$1" || exit
    tn 'nvim .'
}

_g() {
  local -a subdirs
  subdirs=( $(cd ~/git-local && echo *) )
  _describe 'subdirectories' subdirs
}

compdef _g g
compdef _g gn

# Docker
alias dcr="docker compose run --rm"
alias dcu="docker compose up"
alias dcb="docker compose build"
alias dcd="docker compose down --remove-orphans"
alias dce="docker compose exec"


# git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gpl="git pull"
alias gps="git push"
alias gaa="git add -A"

# Check for custom conf in .zshrc.local
if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

# NeoVim
alias vim="nvim"
alias vi="nvim"
alias nv="nvim"

# print all commands (cheatsheet)
alias tch="echo ' tka = tmux kill-session -a \n tks = tmux kill-session -t \n tksa = tmux kill-server \n ta = tmux attach -t \n tl = tmux ls  \n tns = tmux new -s'"

# Setting repeat rate, (first check that xset is installed)
if [ -x "$(command -v xset)" ]; then
    xset r rate 300 45
fi

# Neofetch
neofetch

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# Aider
alias aider='aider --no-auto-commits'
alias aidera='aider --architect'
alias aidera_r1='aider --architect --model openrouter/deepseek/deepseek-r1 --editor-model openrouter/anthropic/claude-3.7-sonnet'
alias aider_sonnet='aider --model openrouter/anthropic/claude-3.7-sonnet --weak-model openrouter/anthropic/claude-3.7-sonnet'
alias aidera_sonnet='aider --architect --model openrouter/anthropic/claude-3.7-sonnet --editor-model openrouter/anthropic/claude-3.7-sonnet'
alias aider_o3='aider --model openrouter/openai/o3-mini --reasoning-effort high --weak-model openrouter/anthropic/claude-3.7-sonnet'

alias aid='aider_sonnet'


# Other aliases
#
alias shost='grep '^Host ' ~/.ssh/config'


