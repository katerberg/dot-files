# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias gits=git

# User specific aliases and functions
export PS1="\$? \w\\$ \[\e[0m\]"
