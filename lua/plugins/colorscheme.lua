return {
  -- add kanagawa theme
  {
    "rebelot/kanagawa.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    enabled = true,
    config = function()
      -- load the colorscheme here
      vim.cmd("colorscheme kanagawa")
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    enabled = false,
    config = function()
      -- load the colorscheme here
      vim.cmd("colorscheme cyberdream")
    end,
  },
  {
    "nyxvamp-theme/neovim",
    priority = 1000, -- ensure it loads first
    enabled = false,
    config = function()
      require("nyxvamp").setup({
        variant = "obsidian", -- 'radiance' (light), 'veil' (dark), 'obsidian' (very dark)
        transparent = false, -- enable transparency
        italics = {
          comments = true,
          keywords = true,
          functions = true,
          strings = true,
          variables = true,
        },
      })

      -- apply the colorscheme after setup
      require("nyxvamp").colorscheme()
    end,
  },
}
