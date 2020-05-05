# linux
[ -f /usr/share/bash-completion/completions/git ] && . /usr/share/bash-completion/completions/git

# macos
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash

alias be='bundle exec'

alias ga='git add -A'
alias gap='ga -p'
alias gca='git commit -v -a'
alias gcam='gca --amend'
alias gc='git commit -v'
alias gcl='git fetch --prune && git branch --merged master | grep -v master | xargs git branch -d'
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
alias gupl='gup && gcl'
alias gur='gh pr create'

__git_complete ga   _git_add
__git_complete gap  _git_add
__git_complete gca  _git_commit
__git_complete gcam _git_commit
__git_complete gc   _git_commit
__git_complete gco  _git_checkout
__git_complete gd   _git_diff
__git_complete gdc  _git_diff
__git_complete gl   _git_log
__git_complete gpf  _git_push
__git_complete gp   _git_push
__git_complete grb  _git_rebase
__git_complete gr   _git_reset
__git_complete grh  _git_reset
__git_complete gs   _git_status
