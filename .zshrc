###############################################################################
# Alias
alias ls="ls --color"
alias grep="grep --color"
alias gs="git status"
alias vi="vim"
alias mycsc="title CSCOPE; cscope -df $CSCOPE_DB"
alias cs="cvs status"
alias cl="cvs log"

###############################################################################
# Prompt
autoload -U promptinit
promptinit
prompt adam2

# Title
print -Pn "\e]0;$hostname[$HOST]-$(basename `pwd`)\a"
chpwd() {
   [[ -t 1 ]] || return
   print -Pn "\e]0;$hostname[$HOST]-$(basename `pwd`)\a"
}

###############################################################################
# Completion
autoload -U compinit
compinit -C

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

###############################################################################
# History
setopt histignorealldups sharehistory
export HISTSIZE=10000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000

###############################################################################
# Cscope
export CSCOPE_EDITOR=vim

###############################################################################
# Xterm
alias xterm='xterm -fg "rgb:ff/ff/ff" -bg "rgb:58/58/59" \
                   -xrm "xterm*color0: rgb:3f/3f/3f"     \
                   -xrm "xterm*color1: rgb:e6/54/65"     \
                   -xrm "xterm*color2: rgb:82/f2/18"     \
                   -xrm "xterm*color3: rgb:e8/e5/00"     \
                   -xrm "xterm*color4: rgb:9a/b8/d7"     \
                   -xrm "xterm*color5: rgb:7f/43/88"     \
                   -xrm "xterm*color6: rgb:55/d5/cd"     \
                   -xrm "xterm*color7: rgb:ff/ff/ff"     \
                   -xrm "xterm*color8: rgb:70/90/80"     \
                   -xrm "xterm*color9: rgb:e6/54/65"     \
                   -xrm "xterm*color10: rgb:82/f2/18"    \
                   -xrm "xterm*color11: rgb:e8/e5/00"    \
                   -xrm "xterm*color12: rgb:9a/b8/d7"    \
                   -xrm "xterm*color13: rgb:ec/93/d3"    \
                   -xrm "xterm*color14: rgb:55/d5/cd"    \
                   -xrm "xterm*color15: rgb:ff/ff/ff"'

###############################################################################
# Local config
[ -f $HOME/.zshrc.local ] && source $HOME/.zshrc.local
