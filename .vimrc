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
"Plugin 'syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
" powerline replaced by airline but keep the font
"Plugin 'powerline/powerline'
Plugin 'bling/vim-airline'
Plugin 'klen/python-mode'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vcscommand.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Colorscheme
Plugin 'mkarmona/colorsbox'
Plugin 'hewo/vim-colorscheme-deepsea'
Plugin 'mattn/webapi-vim'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global config
syntax on
set mouse=a
set background=dark
set exrc
set laststatus=2
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:s,=,l0,gs,hs,ps,ts,+s,c3,C0,(0,us,U0,w0,m0,j0,)50,*200
set bs=2 " fix the backspace
set wildmenu   " visual autocomplete for command menu
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h12
set guioptions-=L
set guioptions-=l
set guioptions-=T
set guioptions-=r
set t_Co=256 " Needed by deepsea and powerline
colorscheme colorsbox-material
set hidden
set nowrap
" Swap files
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep
" command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen
autocmd QuickFixCmdPost *grep* botright cwindow
nnoremap \ :silent grep!

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map config
" Leaser map to space
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

" Shortcut
map <leader>q :q!<cr>
map <leader>Q :qall!<cr>
map <leader>w :w!<cr>
map <leader>W :wall!<cr>
map <leader>ss :source $HOME/.vimrc<cr>
map <leader>so :e $HOME/.vimrc<cr>
map <leader>d :VCSVimDiff<cr>
map <leader>tf :NERDTreeFind<cr>
map <leader>tt :NERDTreeToggle<cr>
map <leader>hh :call matchadd('Error', '<C-R><C-W>')<CR>
vmap <leader>hh y:call matchadd('Error', '<C-R>"')<CR>
map <leader>hc :call clearmatches()<CR>
vmap * y/<C-R>"<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffer
nnoremap <leader>b :ls<CR>:b

" Tab
nnoremap <C-T> :tab split<CR>

" JS-Beautify
vmap <leader>j : ! js-beautify -i -s 2<CR>
map <leader>j :%! js-beautify -i -s 2<CR>

" Trailing space
map <leader>tr :%s/\s\+$//g<CR>

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
" Cscope config
if filereadable("cscope.out")
   cscope add cscope.out
   set cscopetag
   "Conflict with Ctrlp
   "map <C-[> :cscope find 3 <C-R>=expand("<cword>")<CR><CR>
elseif $CSCOPE_DB != ""
   cscope add $CSCOPE_DB
   set cscopetag
   "map <C-[> :cscope find 3 <C-R>=expand("<cword>")<CR><CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Explore config
noremap <C-e> :Vexplore<CR>
let g:netrw_list_hide = '.swp$,.git$'

let g:netrw_browse_split = 0
let g:netrw_preview      = 1     " p: preview vertical split
let g:netrw_liststyle    = 3     " tree styke listing
let g:netrw_winsize      = 30    " % of the width of Explore window

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clang-format
map <leader>f :%pyf $HOME/Repo/clang+llvm-3.7.0-x86_64-linux-gnu-ubuntu-14.04/share/clang/clang-format.py<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-p
let g:ag_highlight=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-p
let g:ctrlp_working_path_mode = 0   " Search file from starting directory
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_switch_buffer = 'e' " Jump to already opened buffer only if in the current window

if executable("ag")
   set grepprg=ag\ --vimgrep
   set grepformat=%f:%l:%c:%m
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
   let g:ctrlp_use_caching = 0
   map <leader>g :silent grep! <C-R>=expand("<cword>")<CR><CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin python-mode config
let g:pymode_folding = 0
au FileType python set shiftwidth=4
au FileType python set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin vim-markdown config
let g:vim_markdown_folding_disabled=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim airline
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#buffer_nr_format = '%s '
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim powerline config with ag instead of grep
"if $POWERLINE_ZSH != ""
"   python from powerline.vim import setup as powerline_setup
"   python powerline_setup()
"   python del powerline_setup
"   let g:Powerline_symbols = 'setup'
"endif
"set encoding=utf-8
"set fillchars+=stl:\ ,stlnc:\
"let g:Powerline_mode_V="V·LINE"
"let g:Powerline_mode_cv="V·BLOCK"
"let g:Powerline_mode_S="S·LINE"
"let g:Powerline_mode_cs="S·BLOCK"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviate
ab jstr JSON.stringify
ab clog console.log
