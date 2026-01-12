-------------------------------------
-- neovimの設定を行うモジュール
-------------------------------------

-- グローバル変数等の初期化
local function initialize()
  vim.scriptencoding = "utf-8"

  vim.g.nvim_appname = vim.env.NVIM_APPNAME or "nvim"

  vim.g.base_dir    = vim.fs.joinpath(vim.env.XDG_CONFIG_HOME, vim.g.nvim_appname)
  vim.g.snippet_dir = vim.fs.joinpath(vim.g.base_dir, "snippets")
  vim.g.rc_dir      = vim.fs.joinpath(vim.g.base_dir, "rc")

  -- 実行環境取得
  if vim.g.vscode then
    vim.g.runtime = "vscode"
  elseif vim.fn.has("win64") == 1 then
    vim.g.runtime = "win64"
  elseif vim.fn.has("win32") == 1 then
    vim.g.runtime = "win32"
  elseif vim.fn.has("wsl") == 1 then
    vim.g.runtime = "wsl"
  elseif vim.fn.has("mac") == 1 then
    vim.g.runtime = "mac"
  elseif vim.fn.has("linux") == 1 then
    vim.g.runtime = "linux"
  elseif vim.fn.has("unix") == 1 then
    vim.g.runtime = "unix"
  else
    vim.g.runtime = "other"
  end
end

-- 環境別の設定。init.luaで呼び出す。
local function setup()
  initialize()

  -- ベースの設定読み込み
  require("config.keymap")
  require("config.option")
  require("config.autocmd")

  -- 実行環境別で必要な設定を行う
  if vim.g.runtime == "vscode" then
    require("config.runtime.vscode")
  elseif vim.g.runtime == "win64" then
    require("config.runtime.windows")
  else
    require("config.runtime.linux")
  end
end

-- `config`モジュールの関数としてsetup関数だけ渡す
return {
  setup = setup,
}