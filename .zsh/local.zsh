PATH=$PATH:$HOME/.rvm/bin       # Add RVM to PATH for scripting
PATH=$PATH:/opt/local/bin       # Mac Ports PATH
PATH=$PATH:/usr/local/mysql/bin # MySQL PATH

export CC=/usr/bin/gcc-4.2

# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
