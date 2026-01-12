local function gather_check_files()
    local glob_patterns = {
        "**/*.lua",
        "**/*.toml",
        "**/*.ts",
    }
    local check_files = {}
    for _, glob_pattern in pairs(glob_patterns) do
        table.insert(check_files, vim.fn.globpath(vim.g.base_dir, glob_pattern, true, true))
        table.insert(check_files, vim.fn.globpath("~/dotfiles/config/nvim", glob_pattern, true, true))
    end
    return vim.tbl_flatten(check_files)
end

local function auto_install_plugins(dpp)
    local notInstallPlugins = vim.iter(vim.tbl_values(dpp.get()))
        :filter(function(p)
            return vim.fn.isdirectory(p.rtp) == 0
        end)
        :totable()
    if #notInstallPlugins > 0 then
        vim.fn["denops#server#wait_async"](function()
            dpp.async_ext_action("installer", "install")
        end)
    end
end

-------------------------------------------------------------------------
-- setup関数
-------------------------------------------------------------------------
local function setup()
    vim.g.hooks_dir   = vim.fs.joinpath(vim.g.base_dir, "lua", "dpp", "plugins", "hooks")
    vim.g.toml_dir    = vim.fs.joinpath(vim.g.base_dir, "lua", "dpp", "plugins", "toml")
    vim.env.HOOKS_DIR = vim.g.hooks_dir
    vim.env.BASE_DIR  = vim.g.base_dir

    if vim.g.nvim_appname == "nvim" then
        vim.g.dpp_cache = vim.fs.joinpath(vim.env.XDG_CACHE_HOME, "dpp")
    else
        vim.g.dpp_cache = vim.fs.joinpath(vim.env.XDG_CACHE_HOME, vim.g.nvim_appname .. "_dpp")
    end
    -- 必要なプラグインだけ別途ランタイムに入れる(自作プラグインマネージャで)
    local mpm = require("plugin_managers.minimal_plugin_manager").setup { install_path = vim.g.dpp_cache }
    mpm.install("Shougo/dpp-ext-lazy")
    mpm.install("Shougo/dpp-ext-toml")
    mpm.install("Shougo/dpp-ext-installer")
    mpm.install("Shougo/dpp-protocol-git")
    mpm.install("Shougo/dpp.vim")
    mpm.install("vim-denops/denops.vim")

    -- dppの設定開始
    local dpp = require("dpp")
    local rc_autocmds = vim.api.nvim_create_augroup("dpp_settings", { clear = true })
    
    -- dppのstateがないから初期化するで
    if dpp.load_state(vim.g.dpp_cache) then
        vim.notify("dppのstateがないから初期化するで", vim.log.levels.INFO)
        vim.fn["denops#server#wait_async"](function()
            dpp.make_state(vim.g.dpp_cache, vim.fs.joinpath(vim.g.base_dir, "dpp", "config.ts"), vim.g.nvim_appname)
            vim.api.nvim_create_autocmd("User", {
                pattern = "Dpp:makeStatePost",
                group = rc_autocmds,
                callback = function()
                    vim.notify("dppのstateを作ったんで、インストールするものないか確認するで", vim.log.levels.INFO)
                    dpp.load_state(vim.g.dpp_cache)
                    auto_install_plugins(dpp)
                    
                    -- 変更箇所を見つけたら終了？
                    vim.api.nvim_create_autocmd("User", {
                        pattern = "Dpp:makeStatePost",
                        group = rc_autocmds,
                        callback = function()
                            vim.cmd.quit({ bang = true })
                        end,
                    })
                end,
                once = true,
                nested = true,
            })
        end)
    else
        vim.notify("dppの設定に変更点ないか、確認するで。あったら取り込んどくわ", vim.log.levels.INFO)
        vim.fn["denops#server#wait_async"](function()
            dpp.check_files()
            dpp.load_state(vim.g.dpp_cache)
            vim.notify("新しいstate取り込んだよ", vim.log.levels.INFO)
            auto_install_plugins(dpp)
            vim.notify("インストール完了やで", vim.log.levels.INFO)
        end)
    end
end

return {
    setup = setup,
}