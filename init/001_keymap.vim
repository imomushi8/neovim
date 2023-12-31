"--------------------------------
" Key Mapping
"--------------------------------
let mapleader = ','

"--------------------------------
" 不要キーマップを消す
"--------------------------------
nnoremap <leader> <nop>
nnoremap K <nop>
nnoremap J <nop>
nnoremap x "_x
nnoremap s "_s


"--------------------------------
" 移動系
"--------------------------------
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
vnoremap <C-k> <C-u>
vnoremap <C-j> <C-d>


"--------------------------------
" バッファ系
"--------------------------------
nnoremap <silent> <C-h> :bprev<CR>
nnoremap <silent> <C-l> :bnext<CR>
nnoremap <silent> <C-d> :bdelete<CR>


"--------------------------------
" ウィンドウ系
"--------------------------------
nnoremap <silent> <C-n> <C-w>w
nnoremap <silent> <C-p> <C-w>W


"--------------------------------
" 挿入系
"--------------------------------
" vv で行末まで選択
vnoremap v ^$h

" 選択範囲のインデントを連続して変更
vnoremap < <gv
vnoremap > >gv


"--------------------------------
" 検索系
"--------------------------------
" カーソル下の単語検索
nnoremap <silent><expr> * "/" . expand('<cword>') . "<CR>N"
nnoremap <silent><expr> <leader>, "/" . expand('<cword>') . "<CR>N"

" カーソル下の単語置換
nnoremap <leader>g :<C-u>%s/<C-r><C-w>//g<Left><Left>

" 検索結果のハイライトを削除
nnoremap <silent> <leader><space> :nohl<CR>

