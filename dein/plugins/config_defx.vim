" Open and Close
nnoremap <silent> <leader>f :<C-U>:Defx -buffer_name=explorer -resume -winwidth=35 -split=vertical `expand('%:p:h')` -search=`expand('%:p')`<CR>

augroup defx_config
  autocmd!
  autocmd BufEnter * call s:InitializeDefx()
  autocmd FileType defx call s:EnterDefxFiler()
  autocmd BufWritePost * call defx#redraw()
augroup END

"============================================================
function! s:InitializeDefx() abort
  call defx#custom#option('_', {
  \ 'direction': 'topleft',
  \ 'show_ignored_files': 1,
  \ 'vertical_preview': 1,
  \ 'columns': 'indent:git:icons:filename:mark'
  \})
  call defx#custom#column('git', 'indicators', {
  \ 'Modified'  : 'M',
  \ 'Staged'    : '+',
  \ 'Untracked' : '-',
  \ 'Renamed'   : 'R',
  \ 'Unmerged'  : '×',
  \ 'Ignored'   : 'I',
  \ 'Deleted'   : 'D',
  \ 'Unknown'   : '?'
  \})
  call defx#redraw()
  call s:OpenDefxIfDirectory()
endfunction

"============================================================
function! s:EnterDefxFiler() abort
  nnoremap <silent><buffer><expr> o
    \ match(bufname('%'), 'explorer') >= 0 ?
    \   (defx#is_directory() ? 0 : defx#do_action('open', 'pedit')) :
    \   (defx#is_directory() ? 0 : defx#do_action('multi', ['drop', 'quit', 'pedit']))
  nnoremap <silent><buffer><expr> O
    \ match(bufname('%'), 'explorer') >= 0 ?
    \   (defx#is_directory() ? 0 : defx#do_action('drop', 'pedit')) :
    \   (defx#is_directory() ? 0 : defx#do_action('multi', ['drop', 'quit', 'pedit']))

  nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> l       defx#is_directory() ? defx#do_action('open') : 0
  nnoremap <silent><buffer><expr> h       defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~       defx#do_action('cd')

  nnoremap <silent><buffer><expr> N       defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> n       defx#do_action('new_file')
  nnoremap <silent><buffer><expr> m       defx#do_action('move')
  nnoremap <silent><buffer><expr> c       defx#do_action('copy')
  nnoremap <silent><buffer><expr> p       defx#do_action('paste')
  nnoremap <silent><buffer><expr> d       defx#do_action('remove')
  nnoremap <silent><buffer><expr> r       defx#do_action('rename')
  nnoremap <silent><buffer><expr> <Esc>   defx#do_action('quit')
  nnoremap <silent><buffer><expr> q       defx#do_action('quit')

  nnoremap <silent><buffer><expr> yy      defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> x       defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> .       defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *       defx#do_action('toggle_select_all')
  
  nnoremap <silent><buffer><expr> > defx#do_action('resize', defx#get_context().winwidth + 5)
  nnoremap <silent><buffer><expr> < defx#do_action('resize', defx#get_context().winwidth - 5)
endfunction


"============================================================
" In launch, if is directory then open defx.
function! s:OpenDefxIfDirectory()
  try
    let l:full_path = expand(expand('%:p'))
  catch
    return
  endtry
  if isdirectory(l:full_path)
    execute "Defx `expand('%:p')` | bd " . expand('%:r')
  endif
endfunction

