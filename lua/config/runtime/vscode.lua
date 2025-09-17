local map = vim.keymap.set

-- カーソル下の単語置換(全置換)
map('n', '<leader>g', ':%s/<C-r><C-w>/', { noremap = true })
