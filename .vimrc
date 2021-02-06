
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
  call dein#add('~/.cache/dein/repos/github.com/ctrlpvim/ctrlp.vim')
  call dein#add('~/.cache/dein/repos/github.com/easymotion/vim-easymotion')
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

" Easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"Golang
"filetype off
"filetype plugin indent off
set autowrite
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
let g:go_fmt_command = "goimports"
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1

" Metalinting
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" Code movement
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
let g:go_def_mode = 'godef'

autocmd FileType go nmap <Leader>i <Plug>(go-info)
let g:go_auto_type_info = 1
set updatetime=500
let g:go_auto_sameids = 1




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
  colorscheme peaksea
  colorscheme neon
elseif has("gui_running")
  colorscheme ironman 
  set gfn=Monospace\ Regular\ 10
  set lines=50 columns=100

elseif exists('GuiColorScheme') == 2
"  "runtime! plugin/guicolorscheme.vim
"j  "expand("/home/ropes/.vim/plugin/guicolorscheme")
"  exe 'GuiColorScheme' molokai
else
  colorscheme neon
  "colorscheme ironman
endif

