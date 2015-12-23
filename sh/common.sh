
# platform-independent aliases
alias m="make -j4"
alias be="bundle exec"
alias c="clear"
alias tree="tree -FAC"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias h='history'
alias g=git

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
    echo \($(basename $branch)$(git_info)\)
  fi
}

rbenv_version()
{
  local ruby_version
  ruby_version=$(rbenv version 2> /dev/null) || return
  echo "‹r$ruby_version" | sed 's/[ \t].*$/›/'
}

pyenv_version()
{
  local python_version
  python_version=$(pyenv version 2> /dev/null) || return
  echo "‹p$python_version" | sed 's/[ \t].*$/›/'
}

