return {
  {
    "bkad/CamelCaseMotion",
    lazy = false,
    init = function()
      vim.g.camelcasemotion_key = "<leader>"
    end,
    keys = {
      { "w",  "<Plug>CamelCaseMotion_w",  { silent = true } },
      { "b",  "<Plug>CamelCaseMotion_b",  { silent = true } },
      { "e",  "<Plug>CamelCaseMotion_e",  { silent = true } },
      { "ge", "<Plug>CamelCaseMotion_ge", { silent = true } },
    }
  },
  {
    "haya14busa/vim-edgemotion",
    lazy = false,
    keys = {
      { "<C-j>", "<Plug>(edgemotion-j)" },
      { "<C-k>", "<Plug>(edgemotion-k)" },
    },
  },
  {
    "rhysd/clever-f.vim"
  },
  {
    "unblevable/quick-scope"
  },
}