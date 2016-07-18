execute pathogen#infect()

filetype on
filetype plugin indent on
syntax on

let mapleader = ","

" Airline
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
"g:airline_symbols
"let g:airline_powerline_fonts = 1

"Python
au BufRead,BufNewFile *.py,*.pyw setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"au BufRead,BufNewFile *.py,*.pyw set expandtab 
au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"set completeopt=menuone,longest,preview

"vim-go
call plug#begin()
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let go_metalinter_autosave = 1

let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

"let g:go_auto_type_info = 1
"set updatetime=100

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

"run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  elseif l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)


"Golang
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
au BufWritePre *.go :GoImports
au BufWritePre *.go :GoFmt
au BufWritePost *.go :GoTestCompile

set tabstop=4
set shiftwidth=4
set expandtab
"set softtabstop=2

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
set t_Co=256

set showcmd "show incomplete commands
set number
"set background=dark

set nobackup
set nowritebackup
set noswapfile
set smarttab

colorscheme Tomorrow-Night-Bright
"colorscheme ironman

