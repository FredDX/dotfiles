""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle config
set mouse=a
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" List of plugin
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'ddrscott/vim-side-search'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rhubarb'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'wincent/terminus'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-surround'
Plugin 'MultipleSearch'

Plugin 'flowtype/vim-flow'
" lint/pretty
" Plugin 'w0rp/ale'
Plugin 'prettier/vim-prettier'

" Colorscheme
Plugin 'tomasr/molokai'
Plugin 'nightsense/seabird'
Plugin 'rakr/vim-one'

" Language specific
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'ElmCast/elm-vim'
Plugin 'leafgarland/typescript-vim'
"Plugin 'Quramy/tsuquyomi'
Plugin 'SirVer/ultisnips'

" Own
Plugin 'code-highlight'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global config
syntax on
set mouse=a
set exrc
set laststatus=2
set cursorline
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=,l0,gs,hs,ps,ts,+s,c3,C0,(0,us,U0,w0,m0,j0,)50,*200
set bs=2 " fix the backspace
set wildmenu " visual autocomplete for command menu
"set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h12
set ttyfast " Faster redrawing.
set lazyredraw " Only redraw when necessary.
set t_Co=256 " Needed by deepsea and powerline
set background=light
"colorscheme colorsbox-material solarized Tomorrow-Night-Eighties lightcolors
"colorscheme molokai
colorscheme one
set termguicolors
set hidden
set nowrap
set noswapfile " Swap files
"set switchbuf+=usetab,newtab " new buffer => new tab
set synmaxcol=500 "reduce performance issue with very long lines
set scrolloff=8 " Number of screen lines to show around the cursor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab config set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search config
set incsearch
set hlsearch
set ignorecase
set smartcase
nnoremap * *N
vmap * y/<C-R>"<CR>N

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map config
let mapleader = " "     " Leaser map to space

" Shortcut
"map <leader>q :q!<cr>
"map <leader>Q :qall!<cr>
"map <leader>w :w!<cr>
"map <leader>W :wall!<cr>

" .vimrc
map <leader>ss :source $HOME/.vimrc<cr>
map <leader>so :e $HOME/.vimrc<cr>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Tab/Split
nnoremap <C-T> :tab split<CR>

" Trailing space
map <leader>tr :%s/\s\+$//g<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep
" command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen
autocmd QuickFixCmdPost *grep* botright cwindow

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree

map <leader>tf :NERDTreeFind<cr>
map <leader>tt :NERDTreeToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ag
let g:ag_highlight=1
let g:ag_prg="ag --column --nogroup"
map <leader>gs :Ag<space>
map <leader>gg :Ag<space><C-R>=expand("<cword>")<CR><CR>
vmap <leader>gg y:Ag<space><C-R>"<CR><CR>
map <leader>gc :cclose<CR>
map <leader>go :botright cwindow<CR>
map <leader>gn :cNext<CR>
map <leader>gN :cprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Side search
"let g:side_search_prg = 'ag --word-regexp --heading --stats -C 5 --group'
let g:side_search_prg = 'ag --heading --stats -C 6 --group'
map <leader>fs :SideSearch<space>
map <leader>ff :SideSearch<space><C-R>=expand("<cword>")<CR><CR>
vmap <leader>ff y:SideSearch<space><C-R>"<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ "Unknown"   : "?"
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Explore config
noremap <C-e> :Vexplore<CR>
let g:netrw_list_hide = '.swp$,.git$'
let g:netrw_browse_split = 0
let g:netrw_preview      = 1     " p: preview vertical split
let g:netrw_liststyle    = 3     " tree styke listing
let g:netrw_winsize      = 30    " % of the width of Explore window

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS beautify
vmap <leader>jj : ! js-beautify -s 2<CR>
map <leader>jj :%! js-beautify -s 2<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CtrlP
let g:ctrlp_working_path_mode = 0   " Search file from starting directory
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_switch_buffer = 'e' " Jump to already opened buffer only if in the current window

if executable("ag")
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
   let g:ctrlp_use_caching = 0
endif

map <leader>bs :CtrlPBuffer<CR>
map <leader>gf <C-P><C-\>w<CR>
vmap <leader>gf <C-P><C-\>v<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin python-mode config
let g:pymode_folding = 0
au FileType python set shiftwidth=4
au FileType python set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-markdown config
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_new_list_item_indent = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_section_y = '' " clean status bar
"let g:airline_section_z = ''
"let g:airline_section_z = airline#section#create([ 'linenr', 'maxlinenr' ])

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS
" allow to open a relative dependency in a require field with gf
autocmd FileType javascript set suffixesadd+=.js
autocmd FileType javascript set path+=.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Notes config
" style setup
if (getcwd()) =~ '\/notes'
  set wrap
  let g:NERDTreeWinSize = 15
  set background=light
  colorscheme seagull
  redraw!
endif

" notes shortcut
map <leader>nc :r!save-clipboard-to-notes<cr>
map <leader>nn :!gst<cr>
map <leader>nd :r!date "+\%F"<cr>E

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copy/paste
vmap <M-c> "+y
map <M-v> "+p
imap <M-v> <ESC>"+pa

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tab shortcut
map <M-1> :1tabnext<CR>
map <M-2> :2tabnext<CR>
map <M-3> :3tabnext<CR>
map <M-4> :4tabnext<CR>
map <M-5> :5tabnext<CR>
map <M-6> :6tabnext<CR>
map <M-7> :7tabnext<CR>
map <M-8> :8tabnext<CR>
map <M-9> :9tabnext<CR>

map <M-Left> :tabprevious<CR>
map <M-Right> :tabnext<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ale (lint)
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 1
let g:ale_linters = {'typescript': ['tsserver']}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimdiff
map <leader>d2 :windo diffthis<CR>
map <leader>do :windo diffoff<CR>
map <leader>dd :Gdiff HEAD^<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MultipleSearch
"map <leader>hh :call matchadd('customMatch1', '<C-R><C-W>')<CR>
"vmap <leader>hh y:call matchadd('customMatch2', '<C-R>"')<CR>
"map <leader>hc :call clearmatches()<CR>
"let g:MultipleSearchMaxColors = 8
"map <leader>hh :Search <C-R><C-W><CR>
"vmap <leader>hh y:Search <C-R>"<CR>
"map <leader>hc :SearchReset<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search path containing this word
map <leader>gi :r!ag<space>-l<space><C-R>=expand("<cword>")<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prettier
let g:prettier#exec_cmd_path = "/home/frederic/.npm-packages/bin/prettier"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<s-tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Browser support
" - gx: open a link in the browser
" - Gbrowse: open the file in github
let g:netrw_browsex_viewer= "google-chrome"


