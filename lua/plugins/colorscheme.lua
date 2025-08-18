return {
  -- add kanagawa theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    enabled = false,
    config = function()
      -- load the colorscheme here
      vim.cmd("colorscheme kanagawa")
    end,
  },
}
