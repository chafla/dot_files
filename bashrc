# Begin stuff from https://github.com/chafla/dot_files

# Color things
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

LS_COLORS="di=94:ow=01;36;40"
export LS_COLORS

# Useful default aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Get colored line numbers
debian_chroot=$(cat /etc/debian_chroot)
PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
# End dot_files stuff
