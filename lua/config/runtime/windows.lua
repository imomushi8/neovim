vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h9"

vim.opt.encoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "cp932" }
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 50

-- <CR+LF>を最優先にする
vim.opt.fileformats = { "dos", "unix", "mac" }

-- シェルの設定
vim.opt.shell = "pwsh"
vim.opt.shellcmdflag = "-command"
vim.opt.shellquote = "\""
vim.opt.shellxquote = ""

-- vim.g.python3_host_prog = vim.fn.system('Write-Host -NoNewline $(Get-Command python | Select-Object -ExpandProperty Definition)')
-- vim.cmd('silent! !rm ' .. vim.fn.expand('$LOCALAPPDATA') .. '/nvim-data/shada/main.shada*')

--------------------------------
-- プラグインマネージャの設定
--------------------------------
require("plugin_managers.dpp").setup()