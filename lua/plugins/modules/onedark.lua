return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  enabled = false,
  config = function()
    require("onedarkpro").setup()
    vim.cmd("colorscheme onedark_vivid")
  end,
}
