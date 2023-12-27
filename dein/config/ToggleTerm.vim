lua >>
require("toggleterm").setup{}
EOF

" By applying the mappings this way you can pass a count to your mapping to open a specific window.
" For example: 2<C-t> will open terminal 2

nnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm size=20 direction=horizontal"<CR>
inoremap <silent><C-t> <Esc><Cmd>exe v:count1 . "ToggleTerm size=20 direction=horizontal"<CR>

" vim.api.nvim_set_keymap('n', '<C-t>', '<Cmd>exe v:count1 . "ToggleTerm size=20 direction=horizontal"<CR>',{noreamap = true, silent = true})
" vim.api.nvim_set_keymap('i', '<C-t>', '<Esc><Cmd>exe v:count1 . "ToggleTerm size=20 direction=horizontal"<CR>', {noreamap = true, silent = true})

"--------------------------------
" augroup
"--------------------------------
augroup toggleterm_config
  autocmd!
  autocmd TermEnter term://*toggleterm#*
        \ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
augroup END

" vim.api.nvim_create_augroup('toggleterm_config', {})
" vim.api.nvim_create_autocmd('TermEnter', {
"   group = 'toggleterm_config',
"   comand = 'term://*toggleterm#* tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>'
" })
