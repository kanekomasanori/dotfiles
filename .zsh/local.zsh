PATH=$PATH:$HOME/.rvm/bin       # Add RVM to PATH for scripting
PATH=$PATH:/opt/local/bin       # Mac Ports PATH
PATH=$PATH:/usr/local/mysql/bin # MySQL PATH
PATH=$PATH:/usr/local/bin       # 
PATH=$PATH:/usr/local/Cellar/git/1.8.0.2/bin

export CC=/usr/bin/gcc-4.2
export PYTHONPATH=/usr/local/lib/python

# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm
