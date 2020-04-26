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
# source ~/.dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# use history substring completion
# source ~/.dotfiles/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# use ^R incremental search
bindkey '^R' history-incremental-search-backward

# bind UP and DOWN arrow keys
# for keycode in '[' '0'; do
#   bindkey "^[${keycode}A" history-substring-search-up
#   bindkey "^[${keycode}B" history-substring-search-down
# done
# unset keycode

# history configuration
HISTSIZE=5000
HISTFILE=~/.zshhistory
SAVEHIST=5000

# completion commands for ~/src ~/mnt 
src(){cd ~/src/$1;}
compctl -W ~/src/ -/ src

# ssh autocomplete configuration

h=($(echo $(history | awk '{print $4 " " $5 "\n"}' | grep 'ssh ' | awk '{print $2}' | sort -u)))
if [[ -r ~/.ssh/config ]]; then
  h=($h ${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
fi
if [[ -r ~/.ssh/known_hosts ]]; then
   h=($h ${${${(f)"$(cat ~/.ssh/known_hosts{,2} || true)"}%%\ *}%%,*}) 2>/dev/null
fi
if [[ $#h -gt 0 ]]; then
  zstyle ':completion:*:ssh:*' hosts $h
  zstyle ':completion:*:slogin:*' hosts $h
fi

