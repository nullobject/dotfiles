#   __   __     __  __     __         __         ______     ______       __     ______     ______     ______
#  /\ "-.\ \   /\ \/\ \   /\ \       /\ \       /\  __ \   /\  == \     /\ \   /\  ___\   /\  ___\   /\__  _\
#  \ \ \-.  \  \ \ \_\ \  \ \ \____  \ \ \____  \ \ \/\ \  \ \  __<    _\_\ \  \ \  __\   \ \ \____  \/_/\ \/
#   \ \_\\"\_\  \ \_____\  \ \_____\  \ \_____\  \ \_____\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\
#    \/_/ \/_/   \/_____/   \/_____/   \/_____/   \/_____/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/
#
# https://joshbassett.info
# https://twitter.com/nullobject
# https://github.com/nullobject

export PATH="$HOME/.local/bin:$HOME/.nodenv/bin:$HOME/.rbenv/bin:$HOME/.cargo/bin:$PATH"

cdpath=($HOME/src/nullobject $HOME/src/mister $HOME/src/tc $HOME/src)

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt append_history
setopt inc_append_history
setopt hist_ignore_dups

# Vita SDK
export VITASDK="/usr/local/vitasdk"
export PATH="$VITASDK/bin:$PATH"

# Quartus
export PATH="/opt/intelFPGA_lite/21.1.1/quartus/bin:$PATH"
export QSYS_ROOTDIR="/opt/intelFPGA_lite/21.1.1/quartus/sopc_builder/bin"

# IDEA
export PATH="/opt/idea/bin:$PATH"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="$(which nvim)"
fi

# Aliases
alias be='bundle exec'
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
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -hl'
alias open='xdg-open'
alias vi='nvim'
alias vim='nvim'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Ruby and NodeJS
eval "$(rbenv init -)"
eval "$(nodenv init -)"

eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/josh/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/home/josh/tmp/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/josh/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/josh/tmp/google-cloud-sdk/completion.zsh.inc'; fi
