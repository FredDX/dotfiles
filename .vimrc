

set mouse=a
set background=dark

set exrc
   
set laststatus=2

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" search config
set incsearch
set hlsearch
set ignorecase
set smartcase

" fix the backspace
set bs=2 

map <F2> :bN<Enter>
map <F3> :bn<Enter>
map <F4> <C-w><C-w>

map <F5> :w!<Enter>

map <F12> :q!<Enter>

"Explore
let g:netrw_list_hide = '.swp,.git'

"pathogen
set nocp
execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme desert

"vim-markdown
let g:markdown_enable_spell_checking = 0
