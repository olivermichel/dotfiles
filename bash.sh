#!/bin/bash

# ls customizations

export CLICOLOR=1
export LSCOLORS=gxxxxxxxcxxxxxcxcxexex
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;36"

alias la="ls -a"
alias ll="ls -lh"
alias lla="ls -lah"
alias tree="tree -FAC"

# command line customization

parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

rvm_version() {
	if [ -x $HOME/.rvm/bin/rvm ]; then
		if [ "$(~/.rvm/bin/rvm-prompt i v)" != "" ]; 
			then echo "[$(~/.rvm/bin/rvm-prompt)] "; 
		fi
	fi
}

export PS1="\[\033[0;32m\]\u@\h \[\033[0;37m\]\$(rvm_version)\033[0m\]\[\033[0;36m\]\w\[\033[0m\] \[\033[0;35m\]\$(parse_git_branch)\[\033[0;38m\]\n> \$ "

# bash calculator
? () { echo "$*" | bc -l; }

alias reload='source ~/.bashrc'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias watchfile='watch -d -n 1 tail -n 25'
alias g='git'
alias r='rails'
alias gh='github'