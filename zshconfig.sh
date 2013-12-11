# enable auto-completion and color modules
autoload -U compinit && compinit
autoload -U colors && colors

# select arrow key select autocompletion style
zstyle ':completion:*' menu select

# auto-complete aliases
setopt completealiases

# make sure prompt substitution is enabled
setopt prompt_subst

# enable command correction
setopt correct

# use fish shell kike syntax highlighting
source ~/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# use history substring completion
source ~/.dotfiles/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# use ^R incremental search
bindkey '^R' history-incremental-search-backward

# bind UP and DOWN arrow keys
for keycode in '[' '0'; do
  bindkey "^[${keycode}A" history-substring-search-up
  bindkey "^[${keycode}B" history-substring-search-down
done
unset keycode

# history configuration
HISTSIZE=5000
HISTFILE=~/.zshhistory
SAVEHIST=5000

# completion commands for ~/src ~/mnt 
src(){cd ~/src/$1;}
compctl -W ~/src/ -/ src

mnt(){cd ~/mnt/$1;}
compctl -W ~/mnt/ -/ mnt

# prompt configuration
PROMPT="%{$fg[green]%}%n@%m%{$reset_color%} %{$fg[cyan]%}%~%{$reset_color%} %{$fg[white]%}\$(rb_info)%{$reset_color%} %{$fg[white]%}\$(py_info)%{$reset_color%} %{$fg[magenta]%}\$(git_branch)%{$reset_color%}
%# "
RPROMPT="%{$fg[red]%}%(?..%?)%{$reset_color%}"

local _ssh_hosts
[ -r ~/.ssh/config ] && _ssh_hosts=($(cat ~/.ssh/config | sed -ne 's/Host[=\t ]//p')) || _ssh_hosts=()
zstyle ':completion:*:hosts' hosts $_ssh_hosts
