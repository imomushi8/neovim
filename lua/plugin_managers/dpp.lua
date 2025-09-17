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
    if vim.g.nvim_appname == "nvim" then
        vim.g.dpp_cache = vim.fs.joinpath(vim.env.XDG_CACHE_HOME, "dpp")
    else
        vim.g.dpp_cache = vim.fs.joinpath(vim.env.XDG_CACHE_HOME, vim.g.nvim_appname .. "_dpp")
    end

    -- 必要なプラグインだけ別途ランタイムに入れる(自作プラグインマネージャで)
    local mpm = require("plugin_managers.minimal_plugin_manager")
    mpm.install("Shougo/dpp-ext-lazy")
    mpm.install("Shougo/dpp-ext-toml")
    mpm.install("Shougo/dpp-ext-installer")
    mpm.install("Shougo/dpp-protocol-git")
    mpm.install("Shougo/dpp.vim")
    mpm.install("vim-denops/denops.vim")

    -- dppの設定開始
    local dpp = require("dpp")
    local rc_autocmds = vim.api.nvim_create_augroup("RcAutocmds", { clear = true })
    if dpp.load_state(vim.g.dpp_cache) then
        vim.fn["denops#server#wait_async"](function()
            dpp.make_state(vim.g.dpp_cache, vim.fs.joinpath(vim.g.base_dir, "dpp", "config.ts"), vim.g.nvim_appname)
            vim.api.nvim_create_autocmd("User", {
                pattern = "Dpp:makeStatePost",
                group = rc_autocmds,
                callback = function()
                    dpp.load_state(vim.g.dpp_cache)
                    auto_install_plugins(dpp)
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
        auto_install_plugins(dpp)
        vim.api.nvim_create_autocmd("BufWritePost", {
            pattern = gather_check_files(),
            group = rc_autocmds,
            callback = function()
                vim.notify("dpp check_files() is run", vim.log.levels.INFO)
                dpp.check_files()
            end,
        })
    end
    vim.api.nvim_create_autocmd("User", {
        pattern = "Dpp:makeStatePost",
        group = rc_autocmds,
        callback = function()
            vim.notify("dpp make_state() is done", vim.log.levels.INFO)
        end,
    })
end

return {
    setup = setup,
}