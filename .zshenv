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
# python
export PATH=$PATH:"$HOME/.local/bin/"

###############################################################################
# scripts
export PATH=$PATH:"/Users/frederic/mycs/bin"

###############################################################################
# Alias
alias ls="ls -G"
alias grep="grep --color"
alias gl="git log --decorate --graph --oneline"
alias gst="git status"
alias gdt="git difftool"
alias gb="git branch --sort=committerdate"
alias getbranch='git branch | grep "*" | cut -d " " -f 2'
alias gitpushlocal='git push -u origin $(getbranch)'

# Useful
alias getLastDownloads='cp ~/Downloads/$(ls -rt ~/Downloads/ | tail -n 1) .'

# Specific for macos
# mvim -v for start in a terminal but no support for the mouse
# alias vi="mvim -v"
# alias vim="mvim -v"
# alias vimdiff="mvimdiff -v"
# alias vimbranch="mvim \$(git diff --name-only master...)"
alias vi="vim"
alias vimbranch="vim \$(git diff --name-only master...)"
alias mycsc="title CSCOPE; cscope -df $CSCOPE_DB"
alias cs="cvs status"
alias cl="cvs log"
alias cdl="cd $(\ls -1t | head -n 1)"
alias tree="tree -AC"
alias jsonpath="node /home/frederic/projects/jsonpath/index.js"
alias debug-structure="coffee /Users/frederic/mycs/debug-structure/index.coffee"

# Notes
alias savenotes="git add *.md; git commit -m 'new notes'"
alias note="cd ~/mycs/notes; mvim TODO.md"

# MYCS
alias mycsopenpr='google-chrome "https://github.com/mycsHQ/$(basename $PWD)/compare/$(getbranch)?expand=1"'
alias mycsci='open https://circleci.com/gh/mycsHQ/workflows/$(basename $PWD)'

###############################################################################
# Android
export ANDROID_HOME="/Users/frederic/NVPACK/android-sdk-macosx"
export PATH=$PATH:"/Users/frederic/NVPACK/android-sdk-macosx/platform-tools"

###############################################################################
# Postgresql
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

###############################################################################
# node
NPM_PACKAGES="$HOME/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

###############################################################################
# go
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

###############################################################################
# my script
export PATH="$PATH:/$HOME/.bin"

###############################################################################
# CUDA
export PATH="/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda/lib64/:$LD_LIBRARY_PATH"
