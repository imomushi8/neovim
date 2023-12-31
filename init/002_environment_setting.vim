"--------------------------------
" OS and Environment Setting
"--------------------------------

"--------------------------------
" 環境依存系
"--------------------------------
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h9

set encoding=UTF-8
set fileencodings=UTF-8,CP932
set ttimeout " IME切り替え時の反応速度を上げる？
set ttimeoutlen=50


"--------------------------------
" OS分岐
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
" エディタ分岐
"--------------------------------
if !exists("g:vscode")
  "--------------------------------
  " ターミナルモード
  "--------------------------------
  "  "新しいタブでターミナルを起動
  "  nnoremap <C-t> :tabe<CR>:terminal<CR>
  "  " Ctrl + q でターミナルを終了
  "  tnoremap <C-q> <C-\><C-n>:q<CR>
  "  tnoremap <C-d> exit<CR><CR>
  "
    " ターミナルモード中にEsc でターミナルノーマルモードに移行
    tnoremap <Esc> <C-\><C-n>
  
  
  "--------------------------------
  " LSP系
  "--------------------------------
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
