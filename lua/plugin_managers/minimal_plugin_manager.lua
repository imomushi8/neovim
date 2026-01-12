-- 自作プラグインマネージャ
-- 参考： https://github.com/yasunori0418/dotfiles/blob/d24f946e808782290093091616fb77b81e8372fb/config/nvim/lua/user/rc.lua
local M = {}

---@diagnostic disable: duplicate-doc-alias
---@alias plugin_add_type
---| "prepend"
---| "append"

M.setup = function(args)
  M.install_path = vim.tbl_deep_extend("force", M.install_path, args or {})
end

---初回起動時にプラグインのダウンロードとruntimepathに追加する
---@param repo string user_name/plugin_name
---@param host? string default: github.com
---@param type? plugin_add_type user_name/plugin_name
M.install = function(repo, host, type)
  host = host or "github.com"
  type = type or "prepend"
  local repo_dir = vim.fs.joinpath(M.install_path, "repos", host, repo)
  local plugin_name = vim.fn.split(repo, "/")[2]
  if not vim.regex("/" .. plugin_name):match_str(vim.o.runtimepath) then
    if vim.fn.isdirectory(repo_dir) ~= 1 then
      os.execute("git clone https://" .. host .. "/" .. repo .. " " .. repo_dir)
    end
    if type == "prepend" then
      vim.opt.runtimepath:prepend(repo_dir)
    else
      vim.opt.runtimepath:append(repo_dir)
    end
  end
end

return M