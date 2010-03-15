source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [[ -s /Users/josh/.rvm/scripts/rvm ]]; then
  source /Users/josh/.rvm/scripts/rvm
fi
