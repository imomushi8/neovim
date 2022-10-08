augroup ddu_config
  autocmd!
  autocmd VimEnter call s:InitializeDDU()
  autocmd FileType ddu-ff call s:ddu_my_settings()
  " autocmd FileType ddu-ff-filter call s:ddu_filter_my_settings()
augroup END

function! s:InitializeDDU() abort
  call ddu#custom#patch_global({
  \ 'ui': 'ff',
  \ 'sources': [
  \   {'name': 'file_rec', 'params': {}}
  \ ],
  \ 'sourceOptions': {
  \   '_': {
  \     'matchers': [
  \       'matcher_substring'
  \     ],
  \     'columns': [
  \       'icon_filename'
  \     ],
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
" ddu
" ---------------------------------------------
function! s:ddu_my_settings() abort
  nnoremap <buffer><silent> <CR>    <Cmd>call ddu#ui#ff#do_action('itemAction')<CR>
  nnoremap <buffer><silent> <Space> <Cmd>call ddu#ui#ff#do_action('toggleSelectItem')<CR>
  nnoremap <buffer><silent> i       <Cmd>call ddu#ui#ff#do_action('openFilterWindow')<CR>
  nnoremap <buffer><silent> q       <Cmd>call ddu#ui#ff#do_action('quit')<CR>
endfunction

function! s:ddu_filter_my_settings() abort
  inoremap <buffer><silent> <CR> <Esc><Cmd>close<CR>
  nnoremap <buffer><silent> <CR> <Cmd>close<CR>
  nnoremap <buffer><silent> q    <Cmd>close<CR>
endfunction
