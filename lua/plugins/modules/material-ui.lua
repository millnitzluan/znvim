return {
  "marko-cerovac/material.nvim",
  enabled = false,
  lazy = false,
  config = function()
    require("material").setup({})

    vim.g.material_style = "deep ocean"
    vim.cmd([[colorscheme material]])
  end,
}
