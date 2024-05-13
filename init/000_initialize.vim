"--------------------------------
" Basic Setting 
"--------------------------------
set mouse=
set hidden
set showcmd
set autoread
set shortmess-=F
set shortmess+=c
set visualbell
set nobackup
set noswapfile
set noundofile
set modifiable
set nocompatible
" set autochdir

"--------------------------------
" Edit Setting
"--------------------------------
set showmatch
set expandtab
set autoindent
set smartindent
set backspace=2
set tabstop=2
set shiftwidth=2
set virtualedit=onemore

set wrapscan
set incsearch
set hlsearch

"--------------------------------
" Visual Setting
"--------------------------------
set number
set cursorline
set laststatus=2
set showtabline=2
set list
set listchars+=tab:\^\

hi Constant ctermfg=14
hi clear CursorLine

"--------------------------------
" LSP Seting
"--------------------------------
set completeopt=menuone,noinsert,noselect

"--------------------------------
" Command Line Setting
"--------------------------------
set wildmode=list:longest
set wildoptions=pum
