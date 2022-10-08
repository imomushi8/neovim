inoremap <silent><expr> <TAB> pum#visible() ? '<cmd>call pum#map#confirm()<CR>' : '<TAB>' 
inoremap <silent><expr> <CR>  pum#visible() ? '<cmd>call pum#map#confirm()<CR>' : '<CR>' 
inoremap <silent>       <C-j> <cmd>call pum#map#select_relative(+1)<CR>
inoremap <silent>       <C-k> <cmd>call pum#map#select_relative(-1)<CR>
inoremap <silent>       <C-y> <cmd>call pum#map#confirm()<CR>
inoremap <silent>       <C-e> <cmd>call pum#map#cancel()<CR>
inoremap <silent>       <BS>  <cmd>call pum#map#cancel()<CR>
