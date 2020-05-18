"Go Lang
filetype off
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
set nocompatible
filetype plugin indent on
syntax on

"Golang

"Python
au BufRead,BufNewFile *.py,*.pyw setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"au BufRead,BufNewFile *.py,*.pyw set expandtab 
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview

set t_Co=256
set encoding=utf-8
set laststatus=2
let mapleader="\\"

set tabstop=4
set shiftwidth=4
set t_Co=256

set showcmd "show incomplete commands
set number
"set background=dark

execute pathogen#infect()
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
set expandtab

set smartindent
set autoindent
set ruler

set ignorecase
set smartcase

inoremap jk <Esc>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

set nobackup
set nowritebackup
set noswapfile
"set smarttab
"filetype indent on
"filetype on
"filetype plugin on
set hlsearch

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if has("gui_running")
  colorscheme ironman 
  set gfn=Monospace\ Regular\ 10
  set lines=50 columns=100

elseif exists('GuiColorScheme') == 2
"  "runtime! plugin/guicolorscheme.vim
"j  "expand("/home/ropes/.vim/plugin/guicolorscheme")
"  exe 'GuiColorScheme' molokai
else
  colorscheme molokai
  "colorscheme ironman
endif

