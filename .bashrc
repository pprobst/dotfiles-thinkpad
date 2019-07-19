#
# ~/.bashrc
#

PATH=~/.local/bin:$PATH
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/Scripts:$PATH"
export PATH="$HOME/Scripts/colorscripts/:$PATH"
export PATH="/opt/java/bin:$PATH"
export GOPATH="$HOME/Documents/Prog/Go"
export PATH="$PATH:/usr/local/go/bin:$GOPATH/bin"

# If not running interactively, don't do anything
export VISUAL=nvim
export EDITOR=nvim

# Environment for wine programs
FREETYPE_PROPERTIES="truetype:interpreter-version=35"

[[ $- != *i* ]] && return

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

#PS1='[\u@\h \W]\$ ' # default
PS1='\w » '

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# xbps aliases
alias xinstall='sudo xbps-install'
alias xremove='sudo xbps-remove'
alias xquery='xbps-query'

# python
alias python='python3'

# qt ls
alias ls='ls --color=auto'

alias vifm='vifmrun'

## example usage:
# echo test | xclip --> stores 'test' to clipboard
# CTRL+ALT+v --> displays 'test' on terminal screen
alias xclip='xclip -selection c'

# displays system info in a fancy way
alias nf='neofetch'

alias reboot='sudo reboot'
alias poweroff='sudo poweroff'

# sshfs
alias sshfs-animu='sshfs probst@192.168.0.14:/home/probst/Animu/ /home/probst/ayanami'
alias sshfs-ext='sshfs probst@192.168.0.14:/run/media/probst/Externo/ /home/probst/ayanami'
alias sshfs-hiro='sshfs probst@192.168.0.14:/run/media/probst/Hiro/ /home/probst/ayanami'

# unmount ayanami (sshfs)
alias usshfs='fusermount -u ~/ayanami'

# youtube-viewer
alias yv='youtube-viewer'

#alias tmux='TERM=screen-256color-bce tmux' # force 256 colors

# selects an area to take a screenshot
#alias maims='maim --hidecursor -s ~/Images/Screenshots/"Screenshot $(date +"%Y-%m-%d") at $(date +"%H.%M".%S)".png'
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# takes a screenshot of whole screen
#alias maimn='maim --hidecursor ~/Images/Screenshots/"Screenshot $(date +"%Y-%m-%d") at $(date +"%H.%M".%S)".png'
#[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
source /bin/activate.sh

# Fish shell
[ -x /bin/fish ] && SHELL=/bin/fish exec /bin/fish
