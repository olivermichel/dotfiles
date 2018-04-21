
# platform-independent aliases
alias tree="tree -FAC"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias b="bundle"
alias c="clear"
alias d="docker"
alias dc="docker-compose"
alias g="git"
alias h="history"
alias m="make -j4"
alias t="tree -FAC"

# grep configuration
export GREP_OPTIONS="--color=auto"
export GREP_COLOR="4;36"

# vi input mode
set -o vi

# find a file with a pattern in name:
ff()
{
  find . -type f -iname '*'$*'*' -ls ;
}

# git branch name and repo status
git_info()
{
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

git_branch()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null)
  if [ "$branch" != "" ]; then
    echo $(basename $branch)$(git_info)
  fi
}

rbenv_version()
{
  local ruby_version=$(rbenv version-name 2> /dev/null) || return

  if [ $ruby_version != "system" ]; then
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

pyenv_version()
{
  local python_version=$(pyenv version-name 2> /dev/null) || return

  if [ $python_version != "system" ]; then
    echo "$python_version "
  fi
}
