autoload colors

# colors
case ${UID} in
  0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
  *)
    PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
    PROMPT="%{${fg[red]}%}%m:%n%{${reset_color}%} "
    RPROMPT="[%~]"
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac

# history
HISTFILE=~/.zsh/history
HISTSIZE=10000000
SAVEHIST=$HISTSIZE
setopt   extended_history share_history inc_append_history
setopt   hist_ignore_space hist_ignore_dups hist_expire_dups_first
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey -v 

# utilities
autoload -Uz is-at-least

source ~/.zsh/env.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/completion.zsh
