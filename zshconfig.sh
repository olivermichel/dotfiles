# enable auto-completion and color modules
autoload -U compinit && compinit
autoload -U colors && colors

# select arrow key select autocompletion style
zstyle ':completion:*' menu select

# auto-complete aliases
setopt completealiases

# make sure prompt substitution is enabled
setopt prompt_subst

PROMPT="%{$fg[green]%}%n@%m%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%} %{$fg[white]%}\$(rb_info)%{$reset_color%} %{$fg[white]%}\$(py_info)%{$reset_color%} %{$fg[magenta]%}\$(git_branch)%{$reset_color%}
%# "
RPROMPT="%{$fg[red]%}%(?..%?)%{$reset_color%}"
