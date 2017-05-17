# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=2000
export HISTSIZE=2000
shopt -s histappend

alias gits=git
alias gti=git

export GIT_EDITOR=vim
export EDITOR=vim

function killport () {
  lsof -t -i :$1 | xargs --no-run-if-empty kill -9
}

# User specific aliases and functions
export PS1="\$? \w\\$ \[\e[0m\]"
