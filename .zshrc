## Command history configuration
##
HISTFILE=${HOME}/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt extended_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt hist_no_store
function history-all { history -E 1 }
setopt hist_ignore_dups
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

alias ll='ls -l'
alias la='ls -A'
alias lh='ls -lh'

alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -g "$@"'

bindkey -v 

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

