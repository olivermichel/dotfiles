# enable cli colors on BSD
export CLICOLOR=1

# ls colors & customization
# file -> white, dir -> cyan, sym -> magenta, socket -> red, pipe -> red
# exec -> green, block -> grey, char -> grey

if [[ $OSTYPE == linux-gnu ]]; then
  export LS_COLORS="no=00:di=36:fi=00:ln=35:ex=32:so=31:pi=31:bd=37:cd=37"
  alias ls="ls -F --color=auto"
  alias la="ls -F --color=auto -a"
  alias ll="ls -F --color=auto -lh"
  alias lla="ls -F --color=auto -lah"
elif [[ $OSTYPE == darwin12.0 ]]; then
  export LSCOLORS="gxfxbxbxcxhxhxcxcxgxgx"
  alias ls="ls -F -G"
  alias la="ls -F -G -a"
  alias ll="ls -F -G -lh"
  alias lla="ls -F -G -lah"
fi

# colors for grep
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;36"

alias c="clear"
alias tree="tree -FAC"

# cd up the hierachy
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# allow full paths when mkdir
alias mkdir='mkdir -p'

# calculator
calc() {
  echo "$*" | bc -l;
}

# find a file with a pattern in name:
ff() {
  find . -type f -iname '*'$*'*' -ls ;
}

# clean display of $PATH
showpath() {
  echo -e ${PATH//:/\\n}
}

# history-related
alias h='history'
alias hg='history | grep'

# git
alias g=git

# show public ip
publicip() {
  dig +short myip.opendns.com @resolver1.opendns.com
}

# handy base conversions
h2d() { 
  echo "ibase=16; obase=A; $1" | bc 
}

d2h() { 
  echo "ibase=10; obase=16; $1" | bc 
}

b2d() { 
  echo "ibase=2; obase=1010; $1" | bc 
}

d2b() { 
  echo "ibase=10; obase=2; $1" | bc 
}

b2h() { 
  echo "ibase=2; obase=10000; $1" | bc 
}

h2b() { 
  echo "ibase=16; obase=2; $1" | bc 
}

# returns 0 if a program is in the path, 1 otherwise
inpath () {
  ! [ $# -eq 1 ] && echo "usage: inpath <bin>" && return 1
  f="$(which "$1" 2>/dev/null)"
  [ -f "$f" ] && return 0
  return 1
}

# git branch name and repo status
git_info() {
  
  gstatus=$(git status)

  if [[ "$gstatus" == *"Changes to be committed"* ]]; then
    output+="*"
  fi

  if [[ "$gstatus" == *"Untracked files"* ]]; then
    output+="+"
  fi

  if [[ "$gstatus" == *"Changes not staged for commit"* ]]; then
    output+="*"
  fi
  
  echo $output
}

git_branch() {  

  branch=$(git symbolic-ref HEAD 2> /dev/null)
  if [ "$branch" != "" ]; then
    echo \($(basename $branch)$(git_info)\)
  fi
}

# cpu loads for OSX and Linux, 3 values space separated
loads() {
  if [[ $OSTYPE == linux-gnu ]]; then
    uptime |  cut -d "," -f 3-5 | awk '{print $3, $4, $5}' | tr -d ','
  elif [[ $OSTYPE == darwin12.0 ]]; then
    uptime |  cut -d "," -f 4-5 | awk '{print $3, $4, $5}' | tr -d ''
  fi
}

# show ruby version if rbenv installed
rb_info() {
  local ruby_version
  ruby_version=$(rbenv version 2> /dev/null) || return
  echo "‹r$ruby_version" | sed 's/[ \t].*$/›/'
}