lua << EOF
require("toggleterm").setup{}
EOF

" By applying the mappings this way you can pass a count to your mapping to open a specific window.
" For example: 2<C-t> will open terminal 2

nnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm size=20 direction=horizontal"<CR>
inoremap <silent><C-t> <Esc><Cmd>exe v:count1 . "ToggleTerm size=20 direction=horizontal"<CR>

"--------------------------------
" augroup
"--------------------------------
augroup toggleterm_settings
  autocmd!
  autocmd TermEnter term://*toggleterm#*
        \ tnoremap <silent><C-t> <Cmd>execute v:count1 . "ToggleTerm"<CR>
augroup end
