export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="crcandy"

zstyle ':omz:update' mode auto # update automatically without asking
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git 1password aliases aws zsh-autosuggestions zsh-syntax-highlighting zsh-completions cd-ls artisan laravel-sail)

source $ZSH/oh-my-zsh.sh


export SSH_AUTH_SOCK=~/.1password/agent.sock

# NVM lazy-loading for faster shell startup
export NVM_DIR="$HOME/.nvm"

# Define _nvm_lazy_load before the wrapper functions
_nvm_lazy_load() {
  unset -f nvm node npm npx yarn _nvm_lazy_load 2>/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}

# Wrapper functions with fallback to direct binary if lazy load fails
nvm() { _nvm_lazy_load 2>/dev/null && nvm "$@"; }
node() { _nvm_lazy_load 2>/dev/null && node "$@" || command node "$@"; }
npm() { _nvm_lazy_load 2>/dev/null && npm "$@" || command npm "$@"; }
npx() { _nvm_lazy_load 2>/dev/null && npx "$@" || command npx "$@"; }
yarn() { _nvm_lazy_load 2>/dev/null && yarn "$@" || command yarn "$@"; }

# Auto-switch node version when entering directories with .nvmrc
autoload -U add-zsh-hook

load-nvmrc() {
  # Ensure NVM is loaded first
  if ! type nvm_find_nvmrc &>/dev/null; then
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  fi

  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc 2>/dev/null)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc 2>/dev/null)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc

export PATH="$PATH:$HOME/.local/bin"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="$HOME/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export FLYCTL_INSTALL="$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"


eval "$(atuin init zsh)"
eval "$(op completion zsh)"
compdef _op op
eval "$(zoxide init zsh)"

export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/opt/ansible@8/bin:$PATH"
export PATH="$HOME/Library/Application Support/Herd/bin:$PATH"


export ARTISAN_OPEN_ON_MAKE_EDITOR=code


#fzf
source <(fzf --zsh)

# Starship prompt initialization
if command -v starship >/dev/null 2>&1; then
  export STARSHIP_CONFIG="$HOME/.config/starship.toml"
  eval "$(starship init zsh)"
fi


source $HOME/.zsh_aliases
