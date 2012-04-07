#!/bin/bash

export CLICOLOR=1
export LSCOLORS=gxxxxxxxcxxxxxcxcxexex
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;36"


# ls customizations
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

rbenv_version() {

  if [ -x "$(which rbenv)" ]; then
    if [ "$(rbenv version-name)" != "system" ]; then
      echo "[$(rbenv version-name)] ";
    fi
  fi
}

rvm_version() {

  if [ -x $HOME/.rvm/bin/rvm ]; then
    if [ "$(~/.rvm/bin/rvm-prompt i v)" != "" ]; then
      echo "[$(~/.rvm/bin/rvm-prompt)] ";
    fi
  fi
}

export PS1="\[\033[0;32m\]\u@\h \[\033[0;37m\]\$(rbenv_version)\$(rvm_version)\033[0m\]\[\033[0;36m\]\w\[\033[0m\] \[\033[0;35m\]\$(parse_git_branch)\[\033[0;38m\]\n> \$ "

# bash calculator
? () { echo "$*" | bc -l; }

alias reload='source ~/.bashrc'

# cd up the hierachy
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# cd and list
cdl() {
  if [ "$1" ]
  then builtin cd "$1" && ll
  else builtin cd && ll
  fi
}

# warn when attempting to override files
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# allow full paths when mkdir
alias mkdir='mkdir -p'

# clean display of $PATH
alias path='echo -e ${PATH//:/\\n}'

# Find a file with a pattern in name:
function ff() {
  find . -type f -iname '*'$*'*' -ls ;
}

# handy extract function
function extract() {
  
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1     ;;
      *.tar.gz)    tar xvzf $1     ;;
      *.bz2)       bunzip2 $1      ;;
      *.rar)       unrar x $1      ;;
      *.gz)        gunzip $1       ;;
      *.tar)       tar xvf $1      ;;
      *.tbz2)      tar xvjf $1     ;;
      *.tgz)       tar xvzf $1     ;;
      *.zip)       unzip $1        ;;
      *.Z)         uncompress $1   ;;
      *.7z)        7z x $1         ;;
      *)           echo "'$1' cannot be extracted via >extract<" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# OSX only: quicklook file
alias ql='qlmanage -p "$@" >& /dev/null'

# application shortcuts
alias g='git'
alias rl='rails'
alias sub='subl'
alias gh='github'

# history-related
alias h='history'
alias hg='history | grep'

function hsum() { 
  history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head;
}

alias myip="dig +short myip.opendns.com @resolver1.opendns.com"
