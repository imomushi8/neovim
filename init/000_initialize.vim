"--------------------------------
" OS Setting
"--------------------------------
if has('win64')
  set shell=powershell
  set shellcmdflag=-command
  set shellquote=\"
  set shellxquote=

  " Windowsのときは<CR+LF>を最優先する
  set fileformats=dos,unix,mac
  if !empty(system('where /Q python && echo has'))
    let g:python3_host_prog='C:\tools\Anaconda3\python.exe'
  endif
else
  " それ以外のときは<CR>を最優先する
  set fileformats=unix,dos,mac
  let g:python3_host_prog = system("bash -c 'echo -n $(which python3)'")
endif

"--------------------------------
" Basic Setting 
"--------------------------------
set hidden
set showcmd
" set autochdir
set mouse=
set autoread
set nobackup
set noswapfile
set noundofile
set modifiable
set encoding=UTF-8
set fileencodings=UTF-8,CP932

set shortmess-=F
set shortmess+=c

hi Constant ctermfg=14
hi clear CursorLine

"--------------------------------
" Input Setting
"--------------------------------
set expandtab
set autoindent
set smartindent
set backspace=2
set tabstop=2
set shiftwidth=2

set wrapscan
set incsearch
set hlsearch

" Japanese support
set ttimeout
set ttimeoutlen=50

"--------------------------------
" Visual Setting
"--------------------------------
set number
set cursorline
set virtualedit=onemore
set visualbell
set showmatch
set laststatus=2
set showtabline=2
set list
set listchars+=tab:\^\
" set listchars+=space:⋅
" set listchars+=eol:↴
syntax enable

"--------------------------------
" LSP Seting
"--------------------------------
set completeopt=menuone,noinsert,noselect


"--------------------------------
" Command Line Setting
"--------------------------------
" This must disabled when using Shougo/pum.vim
" set wildmode=list:longest
" set wildoptions=pum

