MAGICK_HOME="/usr/local/bin"
DYLD_LIBRARY_PATH="$MAGICK_HOME/lib"

if [ -f ~/.bash_private ]; then
  source ~/.bash_private
fi

alias tm='tmuxinator'

source ~/.git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1='\u@\h \W\[\033[01;32m\]$(__git_ps1 "(%s)")\[\e[m\]\$ '

export EDITOR=vim

PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
export PATH

if [ -f /usr/local/bin/hub ]; then
  eval "$(hub alias -s)"
fi

# Make calls to rvm act on rbenv
if [ -f $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
  function rvm () {
    if [[ $1 == 'use' ]]; then
      rbenv shell $2
    fi
  }
fi
