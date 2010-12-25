#!/bin/bash

# ls customizations

export CLICOLOR=1
export LSCOLORS=gxxxxxxxcxxxxxcxcxexex

alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"

# command line customization

parse_git_branch () {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\[\033[0;32m\]\u@\h \[\033[0;36m\]\w\[\033[0m\] \[\033[0;35m\]\$(parse_git_branch)\[\033[0;38m\]\n> \$ "


