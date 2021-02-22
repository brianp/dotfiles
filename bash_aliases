MAGICK_HOME="/usr/local/bin"
DYLD_LIBRARY_PATH="$MAGICK_HOME/lib"
export GPG_TTY=$(tty)

if [ -f ~/.bash_private ]; then
  source ~/.bash_private
fi

if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

eval "$(direnv hook bash)"

source ~/.git-completion.bash
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export PS1='\u@\h \W\[\033[01;32m\]$(__git_ps1 "(%s)")\[\e[m\]\$ '

export EDITOR=nvim

PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH
export PATH

if [ -f /usr/local/bin/hub ]; then
  eval "$(hub alias -s)"
fi

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# heroku autocomplete setup
HEROKU_AC_BASH_SETUP_PATH=/Users/brianp/Library/Caches/heroku/autocomplete/bash_setup && test -f $HEROKU_AC_BASH_SETUP_PATH && source $HEROKU_AC_BASH_SETUP_PATH;
