
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
  local ruby_version=$(rbenv version-name 2> /dev/null) || return

  if [ $ruby_version != "system" ]; then
    echo "‹ruby-$ruby_version›"
  fi
}

pyenv_version()
{
  local python_version=$(pyenv version-name 2> /dev/null) || return

  if [ $python_version != "system" ]; then
    echo "‹python-$python_version›"
  fi
}
