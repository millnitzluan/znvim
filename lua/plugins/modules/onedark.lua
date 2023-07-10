return {
  "olimorris/onedarkpro.nvim",
  lazy = false,
  enabled = true,
  config = function()
    require("onedarkpro").setup()
    vim.cmd("colorscheme onedark_vivid")
  end,
}
