"=================================================================================
" キーマッピング
let mapleader = ','

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
" tnoremap <silent> <C-h> :bprev<CR>
" tnoremap <silent> <C-l> :bnext<CR>
" tnoremap <silent> <C-D> :bdelete!<CR>

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

"--------------------------------
" ターミナルモード
"--------------------------------
if (!exists("g:vscode"))
  "新しいタブでターミナルを起動
  nnoremap <C-t> :tabe<CR>:terminal<CR>
  " Ctrl + q でターミナルを終了
  tnoremap <C-q> <C-\><C-n>:q<CR>
  tnoremap <C-d> exit<CR><CR>
  " ターミナルモード中にEsc でターミナルノーマルモードに移行
  tnoremap <Esc> <C-\><C-n>
endif


"--------------------------------
" LSP系
"--------------------------------
if (!exists("g:vscode"))
  nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
  nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
  nnoremap <silent> gs    <cmd>lua vim.lsp.buf.document_symbol()<CR>
  nnoremap <silent> gi    <cmd>lua vim.lsp.buf.implementation()<CR>
  nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
  nnoremap <silent> gR    <cmd>lua vim.lsp.buf.rename()<CR>
  nnoremap <silent> gw    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
  nnoremap <silent> gl    <cmd>lua vim.diagnostic.open_float(0, {scope="line"})<CR>
  nnoremap <silent> <A-l> <cmd>lua vim.lsp.buf.format { async = true }<CR>
  nnoremap <silent> <A-h> <cmd>lua vim.lsp.buf.signature_help()<CR>
endif