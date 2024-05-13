function! s:ddc_initialize() abort
  call ddc#custom#patch_global({
  \ 'backspaceCompletion': v:true,
  \ 'autoCompleteEvents': ['InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged'],
  \ 'ui': 'pum',
  \ 'sources': ['lsp', 'around'],
  \ 'cmdlineSources': {
  \   ':': ['cmdline'],
  \   '/': ['around', 'cmdline-history'],
  \   '?': ['around', 'cmdline-history'],
  \  },
  \ 'sourceOptions': {
  \   '_': {
  \     'matchers': ['matcher_head'],
  \     'sorters': ['sorter_rank'],
  \     'converters': ['converter_remove_overlap'],
  \     'minAutoCompleteLength': 1,
  \     'ignoreCase': v:true,
  \   },
  \   'lsp': {
  \     'mark': 'LSP',
  \     'dup': 'keep',
  \     'forceCompletionPattern': '\.\w*|:\w*|->\w*'
  \   },
  \   'around': {
  \     'mark': 'Arroud',
  \   },
  \   'cmdline': {
  \     'mark': 'Command Line',
  \   },
  \   'cmdline-history': {
  \     'mark': 'History',
  \   },
  \ },
  \})

  "\     'sorters': ['sorter_lsp-kind', 'sorter_rank'],
  "\ 'sourceParams': {
  "\   'lsp': {
  "\     'lspEngine': 'nvim-lsp',
  "\     'snippetEngine': denops#callback#register({
  "\           body -> vsnip#anonymous(body) }),
  "\     'enableResolveItem': v:true,
  "\     'enableAdditionalTextEdit': v:true,
  "\     'confirmBehavior': 'replace',
  "\   },
  "\ },


  " ddc を利用可能にする
  call ddc#enable()

  " 標準のポップアップメニューの設定を初期化
  set wildmode=full
  set wildoptions=pum,tagfile
  set completeopt=menu,preview


  "=========================================================================
  " Key Mapping
  "=========================================================================
  inoremap <silent><expr> <TAB> pum#visible() ? pum#map#confirm() : '<TAB>'
  inoremap <silent><expr> <CR>  pum#visible() ? pum#map#confirm() : '<CR>'
  inoremap <silent><expr> <C-j> pum#map#select_relative(+1)
  inoremap <silent><expr> <C-k> pum#map#select_relative(-1)
  inoremap <silent><expr> <C-y> pum#map#confirm()
  inoremap <silent><expr> <C-e> pum#map#cancel()
  inoremap <silent><expr> <BS>  pum#map#cancel()

  " コマンドライン補完の呼び出しをしてから通常キー入力とする
  nnoremap : <Cmd>call DdcCommandlinePre()<CR>:

endfunction


" Command Line Completion Key Mapping
function! DdcCommandlinePre() abort
  cnoremap <silent><expr> <Tab> '<Cmd>call pum#visible() ? pum#map#confirm()<CR>' : '<Tab>' 
  cnoremap <silent><expr> <C-j> pum#map#insert_relative(+1)
  cnoremap <silent><expr> <C-k> pum#map#select_relative(-1)
  cnoremap <silent><expr> <C-y> pum#map#confirm()
  cnoremap <silent><expr> <C-e> pum#map#cancel()

  " コマンドラインを抜ける度にdisableされるのでenableにする
  call ddc#enable_cmdline_completion()
endfunction

function! DdcCommandlinePost() abort
  silent! cunmap <Tab>
  silent! cunmap <C-j>
  silent! cunmap <C-k>
  silent! cunmap <C-y>
  silent! cunmap <C-e>
endfunction

augroup ddc_settings
  autocmd!
  autocmd BufEnter * call s:ddc_initialize()
  " コマンドラインから抜け出すときにキーバインド等を変える
  autocmd User DDCCmdlineLeave ++once call DdcCommandlinePost()
  autocmd InsertEnter <buffer> ++once call DdcCommandlinePost()
augroup end
