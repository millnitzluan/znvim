return {
  "catppuccin/nvim",
  enabled = true,
  lazy = false,
  priority = 150,
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      highlight_overrides = {
        mocha = function(C)
          return {
            TabLineSel = { bg = C.pink },
            TelescopeBorder = { link = "FloatBorder" },
          }
        end,
      },
      integrations = {
        cmp = true,
        dap = {
          enabled = true,
          enable_ui = true,
        },
        gitsigns = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        markdown = true,
        native_lsp = {
          enabled = true,
        },
        neogit = true,
        neotree = true,
        notify = true,
        nvimtree = true,
        telescope = true,
        harpoon = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
        lsp_trouble = true,
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}
