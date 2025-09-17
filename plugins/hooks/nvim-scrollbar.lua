local colors = require("catppuccin.palettes").get_palette "mocha"
require("scrollbar").setup({
  marks = {
    Search = { color = colors.flamingo },
    Error = { color = colors.red },
    Warn = { color = colors.yellow },
    Info = { color = colors.sky },
    Hint = { color = colors.teal },
    Misc = { color = colors.green },
  }
})

require("scrollbar.handlers.search").setup()
-- require("hlslens").setup({
--   build_position_cb = function(plist, _, _, _)
--     require("scrollbar.handlers.search").handler.show(plist.start_pos)
--   end,
-- })

-- vim.cmd([[
--   augroup scrollbar_search_hide
--     autocmd!
--     autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
--   augroup END
-- ]])
