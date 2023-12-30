lua << EOF
metals_config = require("metals").bare_config()
metals_config.settings = {
  showImplicitArguments = true,
  showInferredType = true,
}
EOF

nnoremap <silent> <leader>ws  <cmd>lua require("metals").worksheet_hover()<CR>
nnoremap <silent> <leader>a   <cmd>lua require("metals").open_all_diagnostics()<CR>

:command MetalsToggleTreeview lua require("metals.tvp").toggle_tree_view()
:command MetalsRevealTreeview lua require("metals.tvp").reveal_in_tree()

augroup metals_settings
  autocmd!
  autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
  " Java のLSPも利用する場合はここがコンフリクトする可能性がある
  autocmd FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)
augroup end
