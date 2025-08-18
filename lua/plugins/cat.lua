return {
  "catppuccin/nvim",
  name = "catppuccin",
  enabled = true,
  priority = 1000,
  opts = {
    flavour = "mocha", -- latte, frappe, macchiato, mocha
  },
  config = function()
    -- load the colorscheme here
    vim.cmd("colorscheme catppuccin-mocha")
  end,
}
