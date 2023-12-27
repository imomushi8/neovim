" ---------------------------------------------
" key mapping
" ---------------------------------------------
" Open as Fuzzy Finder
nnoremap <silent><expr> ;f g:StartDDUForFF()

function! s:ddu_ui_ff_keymapping() abort
  nnoremap <buffer><silent> <CR>    <Cmd>call ddu#ui#do_action('itemAction')<CR>
  nnoremap <buffer><silent> .       <Cmd>call ddu#ui#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i       <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> a       <Cmd>call ddu#ui#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q       <Cmd>call ddu#ui#do_action('quit')<CR>
endfunction

function! s:ddu_filter_my_keymapping() abort
  inoremap <buffer><silent> <CR> <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR> <Cmd>close<CR>
  nnoremap <buffer><silent> q    <Cmd>close<CR>
endfunction

" ---------------------------------------------
" ignoreDirectories
" ---------------------------------------------
let g:ignoreDir = ['.git', '.vscode', '.metals', 'target', '__pycache__', '.ipynb_checkpoints']

function! s:dduScala() abort
  let g:ignoredDir = ['.git', '.vscode', '.metals', 'target']
endfunction

function! s:dduPython() abort
  let g:ignoredDir = ['.git', '.vscode', , '__pycache__', '.ipynb_checkpoints']
endfunction

"================================================================================
" Open as Fuzzy Finder
function! g:StartDDUForFF() abort
  let win_border = 'rounded'
  let win_height = '&lines - 3'
  let win_width = '&columns / 2 - 3'
  let win_col = 1
  let win_row = 0
  let preview_row = 3
  let preview_col = '&columns / 2'
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
  \	  'ff': {
  \	    'ignoreEmpty': v:true,
  \	    'split': 'floating',
  \	    'startAutoAction': v:true,
  \	    'autoAction': { 'name': 'preview', 'delay': 0, },
  \	    'prompt': '> ',
  \	    'startFilter': v:true,
  \	    'filterSplitDirection': 'floating',
  \	    'filterFloatingPosition': 'top',
  \	    'floatingBorder': win_border,
  \	    'winHeight': win_height,
  \	    'winWidth': win_width,
  \	    'winRow': win_row,
  \	    'winCol': win_col,
  \	    'previewFloating': v:true,
  \	    'previewFloatingBorder': win_border,
  \	    'previewHeight': win_height,
  \	    'previewWidth': win_width,
  \	    'previewRow': preview_row,
  \	    'previewCol': preview_col,
  \	  },
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
" augroup
" ---------------------------------------------
augroup ddu_config_ff
  autocmd!
  autocmd FileType ddu-ff        call s:ddu_ui_ff_keymapping()
  autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
  
  autocmd FileType scala call s:dduScala()
  autocmd FileType py    call s:dduPython()
augroup END
