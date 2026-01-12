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

