
# platform-independent aliases
alias tree="tree -FAC"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias b="bundle"
alias c="clear"
alias d="docker"
alias n="node"
alias g="git"
alias h="history"
alias m="make -j4"
alias t="tree -FAC"

alias dc="docker-compose"
alias ap="ansible-playbook"

# vi input mode
set -o vi

# find a file with a pattern in name:
ff()
{
  find . -type f -iname '*'$*'*' -ls ;
}

# git branch name and repo status
git_status()
{
  local gstatus=`git status`
  local out=''
  if [[ $gstatus == *'Changes to be committed'* ]]; then
    out+='/'
  fi
  if [[ $gstatus == *'Changes not staged for commit'* ]]; then
    out+='+'
  fi
  if [[ $gstatus == *'Untracked files'* ]]; then
    out+='?'
  fi
  echo $out
}

git_branch()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ "$branch" != "" ]]; then
    echo " $(basename $branch)$(git_status)"
  fi
}

rbenv_version()
{
  local ruby_version=$(rbenv version-name 2> /dev/null) || return

  if [[ $ruby_version != "system" ]]; then
    echo $ruby_version
  else
    return 1
  fi
}

rbenv_gemset() {
  if [[ -f .rbenv-gemsets ]]; then
    echo "/$(rbenv gemset active | cut -d ' ' -f 1)"
  else
    return 1
  fi
}

renv() {
  set -a
  [ -f .env ] && . .env
  set +a
}
