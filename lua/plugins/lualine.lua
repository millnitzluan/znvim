-- local defaultColors = {
--   black = "#080808",
--   white = "#ffffff",
--   blue = "#80a0ff",
--   cyan = "#79dac8",
--   red = "#ff5189",
-- }
--
-- local colors = {
--   gruv_bg = "#282828",
--   gruv_bg_dark = "#413e3d",
-- }
--
-- local bubbles_theme = {
--   normal = {
--     a = { fg = defaultColors.white, bg = colors.gruv_bg_dark },
--     b = { fg = defaultColors.white, bg = colors.gruv_bg_dark },
--     c = { fg = defaultColors.black, bg = colors.gruv_bg },
--   },
--
--   insert = { a = { fg = defaultColors.black, bg = defaultColors.blue } },
--   visual = { a = { fg = defaultColors.black, bg = defaultColors.cyan } },
--   replace = { a = { fg = defaultColors.black, bg = defaultColors.red } },
--
--   inactive = {
--     a = { fg = defaultColors.white, bg = colors.gruv_bg },
--     b = { fg = defaultColors.white, bg = colors.gruv_bg },
--     c = { fg = defaultColors.black, bg = colors.gruv_bg },
--   },
-- }
--

require("lualine").setup({
  options = {
    component_separators = "",
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree" },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = {
      {
        "filename",
        file_status = true,
        path = 1,
        shorting_target = 40,
        symbols = {
          modified = "[+]",
          readonly = "[-]",
          unnamed = "[No Name]",
        },
      },
      "branch",
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "filetype", "progress" },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
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
