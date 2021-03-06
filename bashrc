#   __   __     __  __     __         __         ______     ______       __     ______     ______     ______
#  /\ "-.\ \   /\ \/\ \   /\ \       /\ \       /\  __ \   /\  == \     /\ \   /\  ___\   /\  ___\   /\__  _\
#  \ \ \-.  \  \ \ \_\ \  \ \ \____  \ \ \____  \ \ \/\ \  \ \  __<    _\_\ \  \ \  __\   \ \ \____  \/_/\ \/
#   \ \_\\"\_\  \ \_____\  \ \_____\  \ \_____\  \ \_____\  \ \_____\ /\_____\  \ \_____\  \ \_____\    \ \_\
#    \/_/ \/_/   \/_____/   \/_____/   \/_____/   \/_____/   \/_____/ \/_____/   \/_____/   \/_____/     \/_/
#
# https://joshbassett.info
# https://twitter.com/nullobject
# https://github.com/nullobject

# If not running interactively, don't do anything
case $- in
  *i*) ;;
    *) return;;
esac

set -o vi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=-1 # infinity

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=no

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

if [ "$color_prompt" = yes ]; then
  PS1='\[\033[01;34m\]\w\[\033[33m\]$(__git_ps1)\[\033[00m\]\$ '
else
  PS1='\w$(__git_ps1)\$ '
fi
unset color_prompt force_color_prompt

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -hlF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# cut/paste aliases
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  elif [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
    source /usr/local/etc/profile.d/bash_completion.sh
  fi

  if [ -f /usr/local/opt/bash-git-prompt/share/gitprompt.sh ]; then
    __GIT_PROMPT_DIR=/usr/local/opt/bash-git-prompt/share
    source /usr/local/opt/bash-git-prompt/share/gitprompt.sh
  fi
fi

export EDITOR=$(which nvim)
export GPG_TTY=$(tty)
export CDPATH="~/src/nullobject:~/src/tc:~/src/mister:~/src/chisel:~/src"
export PATH="$HOME/.nodenv/bin:$HOME/.rbenv/bin:$HOME/.cargo/bin:$PATH"

# Vita SDK
export VITASDK="/usr/local/vitasdk"
export PATH="$VITASDK/bin:$PATH"

# Quartus
export PATH="/opt/intelFPGA_lite/19.1/quartus/bin:$PATH"
export QSYS_ROOTDIR="/opt/intelFPGA_lite/19.1/quartus/sopc_builder/bin"

# IDEA
export PATH="/opt/idea/bin:$PATH"

# RubyMine
export PATH="/opt/rubymine/bin:$PATH"

# Deno
export DENO_INSTALL="/home/josh/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Ruby and NodeJS
eval "$(rbenv init -)"
eval "$(nodenv init -)"

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Fuzzy finder
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /usr/share/doc/fzf/examples/key-bindings.bash ] && source /usr/share/doc/fzf/examples/key-bindings.bash
