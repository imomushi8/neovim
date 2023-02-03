" Open as Fuzzy Finder
nnoremap <silent><expr> ;f <SID>startDDUForFF()

augroup ddu_config
  autocmd!
  autocmd FileType ddu-ff        call s:ddu_my_settings()
  autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()

  autocmd FileType scala call s:dduScala()
  autocmd FileType py    call s:dduPython()
augroup END

" ignoreDirectories
let g:ignoreDir = ['.git', '.vscode', '.metals', 'target', '__pycache__', '.ipynb_checkpoints']

function! s:dduScala() abort
  let g:ignoredDir = ['.git', '.vscode', '.metals', 'target']
endfunction

function! s:dduPython() abort
  let g:ignoredDir = ['.git', '.vscode', , '__pycache__', '.ipynb_checkpoints']
endfunction

" Open as Fuzzy Finder
function! s:startDDUForFF() abort
  call ddu#start({
  \ 'ui': 'ff',
  \ 'sources': [
  \   {
  \     'name': 'file_rec',
  \     'params': {
  \       'ignoredDirectories': g:ignoreDir,
  \     },
  \   },
  \ ],
  \ 'uiParams': {
  \   'ff': {
  \     'split': 'horizontal',
  \   }
  \ },
  \ 'sourceOptions': {
  \   '_': {
  \     'matchers': ['matcher_substring'],
  \     'columns': ['icon_filename'],
  \   },
  \   'file_rec': { 
  \     'path': getcwd()
  \   },
  \ },
  \ 'kindOptions': {
  \   'file': {
  \     'defaultAction': 'open',
  \   }
  \ }
  \})
endfunction


" ---------------------------------------------
" key mapping
" ---------------------------------------------
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>    <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> .       <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i       <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> a       <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q       <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR> <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR> <Cmd>close<CR>
  nnoremap <buffer><silent> q    <Cmd>close<CR>
endfunction
