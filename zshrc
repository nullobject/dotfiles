#   __   __     __  __     __         __         ______     ______       __     ______     ______     ______
#  /\ "-.\ \   /\ \/\ \   /\ \       /\ \       /\  __ \   /\  == \     /\ \   /\  ___\   /\  ___\   /\__  _\
#  \ \ \-.  \  \ \ \_\ \  \ \ \____  \ \ \____  \ \ \/\ \  \ \  __<    _\_\ \  \ \  __\   \ \ \____  \/_/\ \/
#   \ \_\\"\_\  \ \_____\  \ \_____\  \ \_____\  \ \_____\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\
#    \/_/ \/_/   \/_____/   \/_____/   \/_____/   \/_____/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/
#
# https://joshbassett.info
# https://twitter.com/nullobject
# https://github.com/nullobject

export PATH="$HOME/.local/bin:$PATH"

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt append_history
setopt inc_append_history
setopt hist_ignore_dups

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

complete -C '/usr/local/bin/aws_completer' aws

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="$(which nvim)"
fi

# Starship
eval "$(starship init zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Amiga SDK
export NDK_INC="/opt/amiga/NDK_1.3/Includes1.3/include.h"
export VBCC="/opt/amiga/vbcc"
export PATH="$VBCC/bin:$PATH"

# Vita SDK
export VITASDK="/usr/local/vitasdk"
export PATH="$VITASDK/bin:$PATH"

# Quartus
export PATH="/opt/intelFPGA_lite/24.1std/quartus/bin:$PATH"

# ULX3S
export PATH="/opt/oss-cad-suite/bin:$PATH"

# Neovim
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# IDEA
export PATH="/opt/idea/bin:$PATH"

# Coursier
export PATH="$PATH:/home/josh/.local/share/coursier/bin"

# Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# C3
export PATH="/opt/c3:$PATH"

# Zig
export PATH="/opt/zig:$PATH"

# Deno
export DENO_INSTALL="/home/josh/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Aliases
alias ga='git add -A'
alias gap='ga -p'
alias gca='git commit -v -a'
alias gcam='gca --amend'
alias gc='git commit -v'
alias gcl='git fetch --prune && git branch --merged main | grep -v main | xargs git branch -d'
alias gco='git checkout'
alias gdc='git diff --cached'
alias gd='git diff -M'
alias gl='git log --date-order --pretty="format:%C(yellow)%h%Cblue%d%Creset %s %C(white) %an, %ar%Creset" --graph'
alias gpf='gp --force-with-lease'
alias gp='git push'
alias gpu='git push-upstream'
alias grbc='git rebase --continue'
alias grb='git rebase'
alias gr='git reset'
alias grh='git reset --hard'
alias grhh='git reset --hard HEAD'
alias gs='git status -sb'
alias gup='git pull'
alias ls='lsd'
alias la='lsd -a'
alias ll='lsd -hl'
alias vi='nvim'
alias vim='nvim'
alias open='xdg-open'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Bun
[ -s "/home/josh/.bun/_bun" ] && source "/home/josh/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Google Cloud SDK
if [ -f '/usr/share/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/share/google-cloud-sdk/completion.zsh.inc'; fi

[ -f "/home/josh/.ghcup/env" ] && source "/home/josh/.ghcup/env" # ghcup-env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

list-upgradable()
{
  sudo apt update
  apt list --upgradable
}

# zsh parameter completion for the dotnet CLI

_dotnet_zsh_complete()
{
  local completions=("$(dotnet complete "$words")")

  # If the completion list is empty, just continue with filename selection
  if [ -z "$completions" ]
  then
    _arguments '*::arguments: _normal'
    return
  fi

  # This is not a variable assignment, don't remove spaces!
  _values = "${(ps:\n:)completions}"
}

compdef _dotnet_zsh_complete dotnet
