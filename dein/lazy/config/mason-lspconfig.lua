local mason_lsp = require("mason-lspconfig")

local opts = { noremap=true, silent=true }

-- Use an on_attach function to only map the following keys after the language server attaches to the current buffer
vim.lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.snippetSupport = true

--------------------------------------------------------------------------------------
-- mason-lspconfig setting
--------------------------------------------------------------------------------------
mason_lsp.setup {
  -- Set up your LSP clients here
  ensure_installed = {
    'vimls',
    'jedi_language_server',
    'rust_analyzer',
    'haskell-language-server',
  },
}

mason_lsp.setup_handlers { function(server_name)
  require("lspconfig")[server_name].setup {
    on_attach = function(client, bufnr)
      -- navic setting
      require("nvim-navic").attach(client, bufnr)

      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gh', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
      vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    end
  }
end }

--------------------------------------------------------------------------------------
-- Key Mapping
--------------------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
