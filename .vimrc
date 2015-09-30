""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global config
set mouse=a
set background=dark
set exrc
set laststatus=2
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=,l0,gs,hs,ps,ts,+s,c3,C0,(0,us,U0,w0,m0,j0,)50,*200
set bs=2 " fix the backspace
syntax on
set wildmenu   " visual autocomplete for command menu
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
colorscheme deepsea

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab config set smartindent
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
if filereadable("cscope.out")
   cscope add cscope.out
   set cscopetag
   map <C-[> :cscope find 3 <C-R>=expand("<cword>")<CR><CR>
elseif $CSCOPE_DB != ""
   cscope add $CSCOPE_DB
   set cscopetag
   map <C-[> :cscope find 3 <C-R>=expand("<cword>")<CR><CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Explore config
map <leader>E :Explore<CR>
let g:netrw_list_hide = '.swp$,.git$'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Start 7.03 config
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
" Ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrl_working_path_mode = 0   " Search file from starting directory
let g:ctrl_max_files = 0
let g:ctrl_max_depth = 40

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-markdown config
let g:markdown_enable_spell_checking = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin python-mode config
let g:pymode_folding = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag configuration
set runtimepath^=~/.vim/bundle/ag

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim powerline config with ag instead of grep
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim
let g:Powerline_symbols = 'fancy'
set t_Co=256
"set encoding=utf-8
"set fillchars+=stl:\ ,stlnc:\
"let g:Powerline_mode_V="V·LINE"
"let g:Powerline_mode_cv="V·BLOCK"
"let g:Powerline_mode_S="S·LINE"
"let g:Powerline_mode_cs="S·BLOCK"

if executable("ag")
   set grepprg=ag\ --nogroup\ --nocolor
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
   let g:ctrlp_use_caching = 0
endif

