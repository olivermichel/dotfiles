
# ls colors & customization
# file -> white, dir -> cyan, sym -> magenta, socket -> red, pipe -> red
# exec -> green, block -> grey, char -> grey
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacedxgx
alias l="ls -G"
alias ls="ls -G"
alias la="ls -G -a"
alias l.="ls -G -a"
alias ll="ls -G -lh"
alias lla="ls -G -lah"
alias ll.="ls -lah"

# other darwin-specific aliases
alias a=archey

# load averages
loads()
{
	uptime | cut -d "," -f 4-5 | awk '{print $3,$4,$5}'
}

