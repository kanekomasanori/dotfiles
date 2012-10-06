
# 補完機能
autoload -U compinit
compinit

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -G"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# 補完候補を詰めて表示
setopt list_packed

# history
HISTFILE=~/.zsh/history
HISTSIZE=1000000
SAVEHIST=$HISTSIZE
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
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# utilities
autoload -Uz is-at-least

source ~/.zsh/env.zsh
source ~/.zsh/alias.zsh

