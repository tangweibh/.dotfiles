# change the color of prompt from white to gray
PS1="\[\033[1;30m\]\u@\h:\w\$\[\033[0m\] "

# servers in northwestern
alias vision1='ssh -X wtt450@vision1.eecs.northwestern.edu'
alias vision2='ssh -X weitang@vision2.eecs.northwestern.edu'
alias vision3='ssh -X weitang@vision3.eecs.northwestern.edu'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# confirmation if delete more than 3 files
alias rm='rm -I --preserve-root' 
