

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

let mapleader = " "

"Execute
map <leader>er <S-v>G:w !zsh <CR>
map <leader>ec :.w !zsh <CR>             " exec the current line
vmap <leader>ec :w !zsh <CR>             " in visual mode, exec the selected lines
map <leader>ea :%w !zsh <CR>
map <leader>ee : !zsh shoot.zsh <CR>
map <leader>et : !zsh shoot.zsh Test<CR>
map <leader>eb {<S-v>}:w !zsh<CR>

"Explore
map <leader>E :Explore<CR>
let g:netrw_list_hide = '.swp$,.git$'

"pathogen
set nocp
execute pathogen#infect()
syntax on
filetype plugin indent on

colorscheme desert

"vim-markdown
let g:markdown_enable_spell_checking = 0
