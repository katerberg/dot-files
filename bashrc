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
alias tn='tmux new -s'
alias tk='tmux kill-session -t'
alias tx='tmuxinator start'
alias gits=git
alias gi=git
alias gti=git
alias sl=ls
alias csrc='cd ~/src'
alias nocors='open -n -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --args --user-data-dir="/tmp/chrome_dev_sess_1" --disable-web-security'
alias mys='mysql -h127.0.0.1 -uroot -A'
alias ocd='OVERCOMMIT_DISABLE=1 '
alias recode-video='for f in *.mp4; do ffmpeg -i "$f" "2${f}" && mv "2${f}" "$f"; done'

alias ytw="yarn test -u --watch"

export GIT_EDITOR=vim
export EDITOR=vim


export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

function killport () {
  lsof -t -i :$1 | xargs --no-run-if-empty kill -9
}

if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# User specific aliases and functions
export PS1="\$? \w\\$ \[\e[0m\]"
export BASH_SILENCE_DEPRECATION_WARNING=1

export CPATH=$(brew --prefix)/include
export LIBRARY_PATH=$(brew --prefix)/lib

# # pyenv
# export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"

archey

## nodenv
#eval "$(nodenv init -)"
#export NODE_BUILD_DEFINITIONS=$(brew --prefix node-build-update-defs)/share/node-build

## go
#export GOROOT="$(brew --prefix golang)/libexec"
#export GOPATH=$HOME/.go
#export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

## RVM
#source ~/.rvm/scripts/rvm
##Rails non-sense for OpsSight
#export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$HOME/.rvm/bin:$PATH"
# alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
# export PATH="/Users/katerberg/.krew/bin:$PATH"
# export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
# export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
