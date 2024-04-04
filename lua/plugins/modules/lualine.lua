return {
  "nvim-lualine/lualine.nvim",
  enabled = true,
  lazy = false,
  event = { "VeryLazy" },
  config = function()
    local colors = {
      blue = "#80a0ff",
      cyan = "#79dac8",
      black = "#080808",
      white = "#c6c6c6",
      red = "#ff5189",
      violet = "#d183e8",
      grey = "#303030",
    }

    local bubbles_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      -- visual = { a = { fg = colors.black, bg = colors.cyan } },
      visual = { a = { fg = "#FF0000", bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    require("lualine").setup({
      options = {
        theme = bubbles_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 100 } },
        lualine_b = { "filename", "branch" },
        lualine_c = {
          "%=", --[[ add your center compoentnts here in place of this comment ]]
        },
        lualine_x = {},
        lualine_y = { "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 100 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
    -- local function location()
    --   local line = vim.fn.line "."
    --   local col = vim.fn.virtcol "."
    --   return string.format("Ln %d,Col %d", line, col)
    -- end
    --
    -- local diagnostics = {
    --   "diagnostics",
    --   sources = { "nvim_diagnostic" },
    --   sections = { "error", "warn" },
    --   diagnostics_color = {
    --     error = "Statusline",
    --     warn = "Statusline",
    --     info = "Statusline",
    --     hint = "Statusline",
    --   },
    --   symbols = {
    --     error = "" .. " ",
    --     warn = "" .. " ",
    --     info = "I",
    --     hint = "H",
    --   },
    --   colored = false,          -- Displays diagnostics status in color if set to true.
    --   update_in_insert = false, -- Update diagnostics in insert mode.
    --   always_visible = true,    -- Show diagnostics even if there are none.
    -- }
    --
    -- local filetype = function()
    --   return vim.bo.filetype
    -- end
    --
    -- require("lualine").setup({
    --   options = {
    --     theme = 'auto'
    --   },
    --   sections = {
    --     lualine_a = { "branch" },
    --     lualine_b = { "filename" },
    --     lualine_c = {
    --       diagnostics,
    --     },
    --     lualine_x = { location },
    --     lualine_y = { filetype },
    --     lualine_z = { "progress" },
    --   },
    -- })
  end,
}
