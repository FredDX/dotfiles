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
alias jsonpath="node /Users/frederic/mycs/jsonpath/index.js"
alias debug-structure="coffee /Users/frederic/mycs/debug-structure/index.coffee"

# Notes
alias savenotes="git add *.md; git commit -m 'new notes'"
alias note="cd ~/mycs/notes; mvim TODO.md"

# MYCS
alias mycsopenpr='open https://github.com/mycsHQ/$(basename $PWD)/compare/$(getbranch)?expand=1'
alias mycsci='open https://circleci.com/gh/mycsHQ/workflows/$(basename $PWD)'

###############################################################################
# Android
export ANDROID_HOME="/Users/frederic/NVPACK/android-sdk-macosx"
export PATH=$PATH:"/Users/frederic/NVPACK/android-sdk-macosx/platform-tools"

###############################################################################
# Postgresql
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

###############################################################################
# PSQL local port
export PSQL_PORT_NINJA=5433
export PSQL_PORT_COM=5434
export PSQL_PORT_IO=5435

###############################################################################
# node
#export NODE_ENV=dev

export NVM_DIR=$HOME/.nvm
#source "/usr/local/opt/nvm/nvm.sh" --no-use
#nvm use v8
export NVM_CD_FLAGS="-q"
export NVM_BIN=$NVM_DIR/versions/node/v8.10.0/bin
export PATH="$NVM_BIN:$PATH"
