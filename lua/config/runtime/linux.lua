vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h9"

vim.opt.encoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "cp932" }
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 50

-- <CR>を最優先にする
vim.opt.fileformats = { "unix", "dos", "mac" }

-- シェルの設定
vim.opt.shell = "bash"

-- vim.g.python3_host_prog = vim.fn.system("echo -n $(which python3)")

--------------------------------
-- プラグインマネージャの設定
--------------------------------
require("plugin_managers.dpp").setup()