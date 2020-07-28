
if &compatible
  set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=/home/ropes/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/ropes/.cache/dein')
  call dein#begin('/home/ropes/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/ropes/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('~/.cache/dein/repos/github.com/fatih/vim-go')
  call dein#add('~/.cache/dein/repos/github.com/vim-airline/vim-airline')
  call dein#add('~/.cache/dein/repos/github.com/airblade/vim-gitgutter')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()
  call dein#save_state()
endif
" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" Required:
filetype plugin indent on
syntax on 


"Golang
"filetype off
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim


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
set termguicolors
set background=light

"Enable mouse click for nvim
set mouse=a
"Fix cursor replacement after closing nvim
"set guicursor=
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>

"See invisible characters
set list listchars=tab:>\ ,trail:+,eol:$

set tabstop=4
set shiftwidth=4
set softtabstop=4

set showcmd "show incomplete commands
set number

"execute pathogen#infect()
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
set expandtab

set smartindent
set autoindent
set nu
set ruler
set mouse=a
set list

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
set smarttab
set hlsearch

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if has("nvim")
  colorscheme papercolor

elseif has("gui_running")
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

