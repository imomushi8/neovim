vim.opt.completeopt = { "menuone", "noinsert", "noselect" }

vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h9"

vim.opt.encoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "cp932" }
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 50

-- <CR>を最優先にする
vim.opt.fileformats = { "unix", "dos", "mac" }

-- シェルの設定
vim.opt.shell = "bash"

--------------------------------
-- Key Mapping
--------------------------------
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


--------------------------------
-- プラグインマネージャの設定
--------------------------------
-- require("plugin_managers.dpp").setup()
require("plugin_managers.lazy").setup({
  ref_path = vim.fs.joinpath("plugins", "lazy", "neovim"),
})
