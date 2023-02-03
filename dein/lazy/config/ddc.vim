" Key Mapping
inoremap <silent><expr> <TAB> pum#visible() ? '<cmd>call pum#map#confirm()<CR>' : '<TAB>' 
inoremap <silent><expr> <CR>  pum#visible() ? '<cmd>call pum#map#confirm()<CR>' : '<CR>' 
inoremap <silent>       <C-j> <cmd>call pum#map#select_relative(+1)<CR>
inoremap <silent>       <C-k> <cmd>call pum#map#select_relative(-1)<CR>
inoremap <silent>       <C-y> <cmd>call pum#map#confirm()<CR>
inoremap <silent>       <C-e> <cmd>call pum#map#cancel()<CR>
inoremap <silent>       <BS>  <cmd>call pum#map#cancel()<CR>

" Command Line Setting and Key Mapping
call ddc#custom#patch_global('backspaceCompletion', 'v:true')
call ddc#custom#patch_global('completionMenu', 'pum.vim')
call ddc#custom#patch_global('autoCompleteEvents',
    \ ['InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged'])
call ddc#enable()

call ddc#custom#patch_global('sources', ['around', 'nvim-lsp'])
call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
    \   'matchers': ['matcher_head'],
    \   'sorters': ['sorter_rank'],
    \   'converters': ['converter_remove_overlap'],
    \   'minAutoCompleteLength': 1
    \ },
    \ 'around': {
    \   'mark': 'Arroud'
    \ },
    \ 'nvim-lsp': {
    \   'mark': 'LSP',
    \   'dup': 'keep',
    \   'forceCompletionPattern': '\.\w*|:\w*|->\w*'
    \ },
    \})

nnoremap : <Cmd>call CommandlinePre()<CR>:

function! CommandlinePre() abort
  cnoremap <silent><expr> <Tab>  pum#visible() ? '<cmd>call pum#map#confirm()<CR>' : '<Tab>' 
  cnoremap <silent>       <C-j> <cmd>call pum#map#insert_relative(+1)<CR>
  cnoremap <silent>       <C-k> <cmd>call pum#map#select_relative(-1)<CR>
  cnoremap <silent>       <C-y> <cmd>call pum#map#confirm()<CR>
  cnoremap <silent>       <C-e> <cmd>call pum#map#cancel()<CR>
  " Overwrite sources
  if !exists('b:prev_buffer_config')
    let b:prev_buffer_config = ddc#custom#get_buffer()
  endif

  call ddc#custom#patch_buffer('cmdlineSources', ['cmdline', 'cmdline-history'])
  call ddc#custom#patch_buffer('sourceOptions', {
        \ 'cmdline': {
        \   'mark': 'Command Line',
        \ },
        \ 'cmdline-history': {
        \   'mark': 'History',
        \ },
        \})
  autocmd User DDCCmdlineLeave ++once call CommandlinePost()
  autocmd InsertEnter <buffer> ++once call CommandlinePost()
  " Enable command line completion
  call ddc#enable_cmdline_completion()
endfunction

function! CommandlinePost() abort
  silent! cunmap <Tab>
  silent! cunmap <C-j>
  silent! cunmap <C-k>
  silent! cunmap <C-y>
  silent! cunmap <C-e>

  " Restore sources
  if exists('b:prev_buffer_config')
    call ddc#custom#set_buffer(b:prev_buffer_config)
    unlet b:prev_buffer_config
  else
    call ddc#custom#set_buffer({})
  endif
endfunction
