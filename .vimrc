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
"powerline replaced by airline but keep the font
"Plugin 'powerline/powerline'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'vcscommand.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'wincent/terminus'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mattn/webapi-vim'
Plugin 'jaxbot/semantic-highlight.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'tpope/vim-surround'

" Colorscheme
Plugin 'mkarmona/colorsbox'
Plugin 'hewo/vim-colorscheme-deepsea'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

" Language specific
Plugin 'leafgarland/typescript-vim'
Plugin 'ledger/vim-ledger'
Plugin 'klen/python-mode'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My script
function! SendContent()
  let data = { 'search': @/, 'file': @%, 'selection': @"}
  let url = 'http://localhost:5000'
  let header = {"Content-Type": "application/json"}
  let res = webapi#http#post(url, webapi#json#encode(data), header)
endfunction
vmap <leader>m :call SendContent()<cr>
map <leader>m :call SendContent()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global config
syntax on
set mouse=a
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
"set lines=40 columns=120 " HYP: it fuck the display on terminal
"colorscheme colorsbox-material
"colorscheme solarized
"colorscheme Tomorrow-Night-Eighties " Install from https://github.com/chriskempson/tomorrow-theme
if has('gui_running')
  set background=light
  colorscheme lightcolors
else
  set background=dark
  colorscheme hybrid
endif
set hidden
set nowrap
" Swap files
set noswapfile
"set switchbuf+=usetab,newtab " new buffer => new tab

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
" - exec the current line
map  <leader>ec :.w !zsh <CR>
" - in visual mode, exec the selected lines
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

" .vimrc
map <leader>ss :source $HOME/.vimrc<cr>
map <leader>so :e $HOME/.vimrc<cr>

" VCS
map <leader>d :VCSVimDiff<cr>

" NERDTree
map <leader>tf :NERDTreeFind<cr>
map <leader>tt :NERDTreeToggle<cr>

" Highlight pattern
map <leader>hh :call matchadd('Error', '<C-R><C-W>')<CR>
vmap <leader>hh y:call matchadd('Error', '<C-R>"')<CR>
map <leader>hc :call clearmatches()<CR>

" Search
vmap * y/<C-R>"<CR>

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffer
"nnoremap <leader>b :ls<CR>:b
"
" Buffergator
let g:buffergator_suppress_keymaps = 1
map <leader>bb :BuffergatorToggle<CR>
map <leader>bf :BuffergatorOpen<CR>
map <leader>bs :CtrlPBuffer<CR>

" Tab/Split
nnoremap <C-T> :tab split<CR>

" JS-Beautify
vmap <leader>jj : ! js-beautify -s 2<CR>
map <leader>jj :%! js-beautify -s 2<CR>

" js 2 coffee
vmap <leader>jc : ! /Users/frederic/mycs/js2coffee/js2coffee<CR>
map <leader>jc :%! /Users/frederic/mycs/js2coffee/js2coffee<CR>

" Trailing space
map <leader>tr :%s/\s\+$//g<CR>

" Insert date
map <leader>id :r!date "+\%Y-\%M-\%d"<CR>
map <leader>ih :r!date "+\%H:\%M"<CR>

" Semantic highlight
map <leader>hh :SemanticHighlightToggle<CR>

" Syntastic
map <leader>sf :w!<CR>:!./node_modules/.bin/eslint --fix %<CR>:e<CR>:redraw<CR>

" Macvim tab
map <D-1> :1tabnext<CR>
map <D-2> :2tabnext<CR>
map <D-3> :3tabnext<CR>
map <D-4> :4tabnext<CR>
map <D-5> :5tabnext<CR>
map <D-6> :6tabnext<CR>
map <D-7> :7tabnext<CR>
map <D-8> :8tabnext<CR>
map <D-9> :9tabnext<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" grep
" command! -nargs=+ MyGrep execute 'silent grep! <args>' | copen
autocmd QuickFixCmdPost *grep* botright cwindow

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
let g:ctrlp_working_path_mode = 0   " Search file from starting directory
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 40
let g:ctrlp_switch_buffer = 'e' " Jump to already opened buffer only if in the current window

if executable("ag")
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
   let g:ctrlp_use_caching = 0
endif

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
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_close_button = 0
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#buffer_nr_format = '%s '
"let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme='bubblegum'


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
" Abbreviate
ab jstr JSON.stringify
ab clog console.log

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" JS

" allow to open a relative dependency in a require field with gf
autocmd FileType javascript set suffixesadd+=.js
autocmd FileType javascript set path+=.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
autocmd FileType markdown set wrap
autocmd FileType markdown let g:NERDTreeWinSize = 15

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffergator
let g:buffergator_autoupdate = 1
let g:buffergator_autodismiss_on_select = 0
let g:buffergator_sort_regime = 'basename'
let g:buffergator_split_size = 30
let g:buffergator_display_regime = 'basename'
let g:buffergator_show_full_directory_path = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ledger
au BufRead,BufNewFile *.dat setfiletype ledger

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Config syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_loc_list_height = 2
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_loc_list_height = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" javascript support
"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_javascript_eslint_exe = './node_modules/.bin/eslint'
