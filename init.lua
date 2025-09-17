-- vimの設定はほぼすべて`lua/config.lua`モジュール内で行う
require("config").setup()
vim.cmd("syntax on")  -- この辺はセットアップ完了後にやらないと意味ないらしい
vim.cmd("filetype plugin indent on")

