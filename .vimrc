""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global config
set mouse=a
set background=dark
set exrc
set laststatus=2
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=,l0,gs,hs,ps,ts,+s,c3,C0,(0,us,U0,w0,m0,j0,)50,*200
set bs=2 " fix the backspace
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab config
set smartindent
set tabstop=3
set shiftwidth=3
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search config
set incsearch
set hlsearch
set ignorecase
set smartcase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map config
map <F2> :bN<Enter>
map <F3> :bn<Enter>
map <F4> <C-w><C-w>
map <F5> :w!<Enter>
map <F6> :source ~/.vimrc<Enter>
map <F12> :q!<Enter>

let mapleader = " "

" Execute content of the current buffer
map  <leader>er <S-v>G:w !zsh <CR>
" exec the current line
map  <leader>ec :.w !zsh <CR>            
" in visual mode, exec the selected lines
vmap <leader>ec :w !zsh <CR>             
map  <leader>ea :%w !zsh <CR>
map  <leader>ee : !zsh shoot.zsh <CR>
map  <leader>et : !zsh shoot.zsh Test<CR>
map  <leader>eb {<S-v>}:w !zsh<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cscope config
if $CSCOPE_DB != ""
   cscope add $CSCOPE_DB
   set cscopetag
   map <C-[> :cscope find 3 <C-R>=expand("<cword>")<CR><CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Explore config
map <leader>E :Explore<CR>
let g:netrw_list_hide = '.swp$,.git$'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start 7 config
if v:version < 703
   finish
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pathogen
" (python-mode, tabular)
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-markdown config
let g:markdown_enable_spell_checking = 0
