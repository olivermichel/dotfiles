#!/bin/bash

# ls customizations

export CLICOLOR=1
export LSCOLORS=gxxxxxxxcxxxxxcxcxexex
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;33"

alias la="ls -a"
alias ll="ls -lh"
alias lla="ls -lah"
alias tree="tree -FAC"

# command line customization

parse_git_branch () {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[0;32m\]\u@\h \[\033[0;36m\]\w\[\033[0m\] \[\033[0;35m\]\$(parse_git_branch)\[\033[0;38m\]\n> \$ "

# bash calculator
? () { echo "$*" | bc -l; }

alias reload='source ~/.bashrc'

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias watchlog='watch -d -n 1 tail -n 25'
alias gittree='git log --graph --oneline --decorate'

alias g='git'