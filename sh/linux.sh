
# ls colors & customization
# file -> white, dir -> cyan, sym -> magenta, socket -> red, pipe -> red
# exec -> green, block -> grey, char -> grey
  
export LS_COLORS="no=00:di=36:fi=00:ln=35:ex=32:so=31:pi=31:bd=37:cd=37"
alias l="ls -F --color=auto"
alias ls="ls -F --color=auto"
alias la="ls -F --color=auto -a"
alias l.="ls -F --color=auto -a"
alias ll="ls -F --color=auto -lh"
alias lla="ls -F --color=auto -lah"
alias ll.="ls -F --color=auto -lah"

# systemd aliases
alias sc="systemctl"
alias jour="journalctl"
alias lscg="systemd-cgls --no-pager"

# allow aliases when using sudo
alias sudo="sudo "

# load averages
loads()
{
	uptime | cut -d "," -f 3-5 | awk '{print $3,$4,$5}' | tr -d ','
}

