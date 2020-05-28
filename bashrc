# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=2000
export HISTSIZE=2000
shopt -s histappend

alias ta='tmux attach-session -t'
alias tl='tmux list-sessions'
alias gits=git
alias gti=git
alias sl=ls
alias nocors='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_sess_1" --disable-web-security'


export GIT_EDITOR=vim
export EDITOR=vim

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

function killport () {
  lsof -t -i :$1 | xargs --no-run-if-empty kill -9
}

# User specific aliases and functions
export PS1="\$? \w\\$ \[\e[0m\]"
export BASH_SILENCE_DEPRECATION_WARNING=1
