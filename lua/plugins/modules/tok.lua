return {
  "tiagovla/tokyodark.nvim",
  lazy = false,
  enabled = true,
  opts = {
    -- custom options here
  },
  config = function(_, opts)
    require("tokyodark").setup(opts)     -- calling setup is optional
    vim.cmd [[colorscheme tokyodark]]
  end,
}
