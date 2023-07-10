return {
  "catppuccin/nvim",
  enabled = false,
  lazy = false,
  priority = 150,
  name = "catppuccin",
  config = function()
    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

    require("catppuccin").setup({
      transparent_background = true,
      -- term_colors = true,
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        lsp_trouble = false,
        cmp = true,
        gitsigns = true,
        telescope = true,
        nvimtree = { enabled = true, show_root = true, transparent_panel = false },
        markdown = true,
        ts_rainbow = true,
      },
    })

    vim.cmd([[colorscheme catppuccin]])
  end,
}
