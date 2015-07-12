# alias
alias ls="ls -G"
alias grep="grep --color"
alias gs="git status"

# prompt
autoload -U promptinit
promptinit
prompt adam2

# completion
autoload -U compinit
compinit -C

# history
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=10000

# path
export PATH=$PATH:$HOME/bin/

# local config
source $HOME/.zshrc.local
