#!/bin/zsh

# Enable emacs keybindings
bindkey -e

# Set default apps
export PAGER='less'
export EDITOR='vim'
export PSQL_EDITOR='vim -c"setf sql"'

# Color the terminal
export CLICOLOR=1
export LSCOLORS=Dxfxcxdxbxegedabadacad
export ZLS_COLORS=$LSCOLORS
export LC_CTYPE=en_US.UTF-8
export LESS=FRX

# Initialize the ZSH completion system
autoload -U compinit; compinit

# Style the prompt
autoload -Uz vcs_info
autoload -U colors; colors
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*' formats "%{$fg[yellow]%}%r/%S%{$fg[white]%} %{$fg[green]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
precmd() { vcs_info }
setopt prompt_subst
PROMPT='${vcs_info_msg_0_}%# '

# Shorthand for my favorite editor
alias vim='/opt/homebrew/bin/vim'

# Shorthand for my python
alias python="python3"

# Find commands I type often so I can alias them
alias typeless='history n 20000 | sed "s/.*  //"  | sort | uniq -c | sort -g | tail -n 100'

# Git ---------------------- {{{
# Reset empty files
gref() {
  command git --no-pager diff --cached --stat | command grep "|\s*0$" | awk '{system("command git reset " $1)}'
}

alias gap='git add -p'
alias gb='git branch'
alias gc='git commit -v'
alias gcheddar='git commit --amend -CHEAD'
alias gco='git checkout'
alias gdoff='git reset HEAD\^'
alias glg='git log --graph --oneline --decorate --color --all'
alias glod='git log --oneline --decorate'
alias glp='git log -p'
alias gnap='git add -N --ignore-removal . && gap && gref'
alias gp='git push'
alias gplease='git push --force-with-lease'
alias gpr='git pull --rebase'
alias gput='git push origin HEAD'
alias gr='git rebase'
alias gra='git rebase --abort'
alias grc='git rebase --continue'
alias grim='git rebase -i main'
alias gst='git status'
# }}}

# History ---------------------- {{{
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
unsetopt HIST_VERIFY
# }}}

# File management ---------------------- {{{
alias ..='cd ..'
# }}}

# Functions ---------------------- {{{
# Format JSON in place with jq
# Usage: prettify filename.json
prettify() {
  local temp_file
  temp_file=$(mktemp) &&
    jq . < "$1" > "$temp_file" &&
    mv -- "$temp_file" "$1"
}
# }}}

# Autoloading ---------------------- {{{
# Load autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
# }}}

# Load fuzzy finding
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Add NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Autoload .nvmrc if present
load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# Load NVM hooks
autoload -U add-zsh-hook
add-zsh-hook chpwd load-nvmrc

# Source plugins
source ~/.zsh/alias-tips/alias-tips.plugin.zsh
