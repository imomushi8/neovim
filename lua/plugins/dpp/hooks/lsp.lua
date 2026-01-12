local servers = {
  'yamlls',
  'vimls',
  'pylsp',
  'rust_analyzer',
}

-- ここで設定
require("trouble").setup()
require('mason').setup()
require("mason-lspconfig").setup {
  ensure_installed       = servers,
  automatic_installation = true,
}

--------------------------------------------------------------------------------------
-- Key Mapping
--------------------------------------------------------------------------------------
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

-- lsp
vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- trouble
vim.api.nvim_set_keymap('n', '<S-t><S-t>', '<cmd>TroubleToggle workspace_diagnostics<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-t><S-d>', '<cmd>TroubleToggle document_diagnostics<CR> ', opts)

