###############################################################################
# PATH
export PATH=$PATH:$HOME/bin/ 

###############################################################################
# Ubuntu config

# Set display for remote login
[ -n "$DISPLAY" -a -f "$(where xrdb)" ] && xrdb -merge $HOME/.Xresources

# Color shortcut
export BLUE="\033[1;34m"
export GREEN="\033[1;32m"
export NO_COLOUR="\033[0m"

###############################################################################
# Local config
[ -f $HOME/.zshenv.local ] && source $HOME/.zshenv.local

