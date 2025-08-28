return {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = false,
  priority = 1000,
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
  },
  config = function()
    -- load the colorscheme here
    vim.cmd("colorscheme catppuccin-mocha")
  end,
}
