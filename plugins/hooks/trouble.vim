lua << EOF
require("trouble").setup {}
EOF

nnoremap <S-t><S-t> :<C-u> TroubleToggle workspace_diagnostics<CR>
nnoremap <S-t><S-d> :<C-u> TroubleToggle document_diagnostics<CR>
