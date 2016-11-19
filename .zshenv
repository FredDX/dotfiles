###############################################################################
# PATH
export PATH=$PATH:$HOME/bin/
export LLVM_BIN=$HOME/Repo/clang+llvm-3.7.0-x86_64-linux-gnu-ubuntu-14.04/bin
[ -d $LLVM_BIN ] && export PATH=$PATH:$LLVM_BIN

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

###############################################################################
# Setup local
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

###############################################################################
# Alias
[ $(echo $OSTYPE) = "darwin15.0.0" ] && alias ls="ls -G" || alias ls="ls --color"
alias grep="grep --color"
alias gl="git log --decorate --graph --oneline"
alias gst="git status"
alias gdt="git difftool -y"
alias gb="git branch --sort=committerdate"
# Specific for macos
# mvim -v for start in a terminal but no support for the mouse
alias vi="vim"
alias mvi="mvim"
alias vimbranch="mvim \$(git diff --name-only master...)"
alias mycsc="title CSCOPE; cscope -df $CSCOPE_DB"
alias cs="cvs status"
alias cl="cvs log"
alias cdl="cd $(\ls -1t | head -n 1)"
alias tree="tree -AC"
alias savenotes="git add *.md; git commit -m 'new notes'"
alias jsonpath="node /Users/frederic/mycs/jsonpath/index.js"
alias debug-structure="coffee /Users/frederic/mycs/debug-structure/index.coffee"

###############################################################################
# Android
export ANDROID_HOME="/Users/frederic/NVPACK/android-sdk-macosx"
export PATH=$PATH:"/Users/frederic/NVPACK/android-sdk-macosx/platform-tools"
