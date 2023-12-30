"--------------------------------
" OS Setting
"--------------------------------
" Windowsのとき
if has('win64')
  " <CR+LF>を最優先にする
  set fileformats=dos,unix,mac

  " シェルの設定
  set shell=pwsh
  set shellcmdflag=-command
  set shellquote=\"
  set shellxquote=

  let g:python3_host_prog = system('Write-Host -NoNewline $(Get-Command python | Select-Object -ExpandProperty Definition)')
  

  silent execute '!rm ' $LOCALAPPDATA . '/nvim-data/shada/main.shada*'

" それ以外のとき
else
  " <CR>を最優先にする
  set fileformats=unix,dos,mac

  " シェルの設定
  set shell=bash

  let g:python3_host_prog = system("echo -n $(which python3)")
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
set viminfo='100,n$HOME/.vim/files/info/viminfo

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
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h9
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
