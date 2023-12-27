" ---------------------------------------------
" key mapping
" ---------------------------------------------
"  TODO なぜか動かんくなった（neovimのバージョンのせい？)
" Open as Filer
nnoremap <silent><expr> <leader>f g:StartDDUForFiler()

function! s:ddu_filer_keymapping() abort
  nnoremap <silent><buffer><expr> o       ddu#ui#async_action('itemAction', {'name': 'open'})
  "nnoremap <silent><buffer><expr> o       ddu#ui#async_action('itemAction')
  
  nnoremap <silent><buffer><expr> j       line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k       line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> l       ddu#ui#get_item()->get('isTree', v:false) ? ddu#ui#async_action('itemAction', {'name': 'narrow'}) : 0
  nnoremap <silent><buffer><expr> h       ddu#ui#async_action('itemAction', {'name': 'narrow', 'params': {'path': '..'}})
  "nnoremap <silent><buffer><expr> l       ddu#ui#get_item()->get('isTree', v:false) ? ddu#ui#async_action('expandItem') : 0
  "nnoremap <silent><buffer><expr> h       ddu#ui#async_action('collapseItem')

  nnoremap <silent><buffer><expr> N       ddu#ui#async_action('itemAction', {'name': 'newDirectory'})
  nnoremap <silent><buffer><expr> n       ddu#ui#async_action('itemAction', {'name': 'newFile'})
  nnoremap <silent><buffer><expr> m       ddu#ui#async_action('itemAction', {'name': 'move'})
  nnoremap <silent><buffer><expr> c       ddu#ui#async_action('itemAction', {'name': 'copy'})
  nnoremap <silent><buffer><expr> p       ddu#ui#async_action('itemAction', {'name': 'paste'})
  nnoremap <silent><buffer><expr> d       ddu#ui#async_action('itemAction', {'name': 'delete'})
  nnoremap <silent><buffer><expr> yy      ddu#ui#async_action('itemAction', {'name': 'yank'})
  nnoremap <silent><buffer><expr> r       ddu#ui#async_action('itemAction', {'name': 'rename'})
  nnoremap <silent><buffer><expr> <Esc>   ddu#ui#async_action('quit')
  nnoremap <silent><buffer><expr> q       ddu#ui#async_action('quit')

  nnoremap <silent><buffer><expr> .       ddu#ui#async_action('toggleSelectItem')
  nnoremap <silent><buffer><expr> *       ddu#ui#async_action('toggleAllItems')
  
  "nnoremap <silent><buffer><expr> >       ddu#ui#async_action('resize', ddu#ui#get_context().winwidth + 5)
  "nnoremap <silent><buffer><expr> <       ddu#ui#async_action('resize', ddu#ui#get_context().winwidth - 5)
endfunction

"================================================================================
" Open as Filer
function! g:StartDDUForFiler() abort
  call ddu#start({
  \   'ui': 'filer',
  \   'uiParams': {
  \     'filer': {
  \       'winWidth': 35,
  \       'split': 'vertical',
  \       'splitDirection': 'topleft',
  \     },
  \   },
  \   'sources': [
  \     {
  \       'name': 'file',
  \       'params': {}
  \     }
  \   ],
  \   'sourceOptions': {
  \     '_': {
  \       'columns': ['icon_filename'],
  \     },
  \   },
  \   'kindOptions': {
  \     'file': {
  \       'defaultAction': 'open',
  \     },
  \   },
	\   'actionOptions': {
	\     'narrow': {
	\       'quit': v:false,
	\     },
	\   },
  \ })
endfunction

function! g:StartDDUForFilerFullScreen(dir) abort
  call ddu#start({
  \   'ui': 'filer',
  \	  'uiParams': {
  \	    'filer': {
  \	      'split': 'vertical',
  \       'splitDirection': 'topleft',
  \	      'winHeight': &lines,
  \	      'winWidth': &columns,
  \	      'winRow': 0,
  \	      'winCol': 0,
  \	    },
  \	  },
  \   'sources': [
  \     {
  \       'name': 'file',
  \       'params': {}
  \     }
  \   ],
  \   'sourceOptions': {
  \     '_': {
  \       'columns': ['icon_filename'],
  \       'path': a:dir,
  \     },
  \   },
  \   'kindOptions': {
  \     'file': {
  \       'defaultAction': 'open',
  \     },
  \   },
	\   'actionOptions': {
	\     'narrow': {
	\       'quit': v:false,
	\     },
	\   },
  \ })
endfunction

" ---------------------------------------------
" augroup
" ---------------------------------------------
augroup ddu_config_filer
  autocmd!
  autocmd FileType ddu-filer call s:ddu_filer_keymapping()
augroup END
