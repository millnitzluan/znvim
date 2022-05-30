local defaultColors = {
  black = "#080808",
  white = "#ffffff",
  blue = "#80a0ff",
  cyan = "#79dac8",
  red = "#ff5189",
}

local colors = {
  -- gruv_bg = "#282C34",
  -- gruv_bg_dark = "#4c525e",
  -- gruv_bg = "#252525",
  gruv_bg = "#282828",
  gruv_bg_dark = "#413e3d",
}

local bubbles_theme = {
  normal = {
    a = { fg = defaultColors.white, bg = colors.gruv_bg_dark },
    b = { fg = defaultColors.white, bg = colors.gruv_bg_dark },
    c = { fg = defaultColors.black, bg = colors.gruv_bg },
  },

  insert = { a = { fg = defaultColors.black, bg = defaultColors.blue } },
  visual = { a = { fg = defaultColors.black, bg = defaultColors.cyan } },
  replace = { a = { fg = defaultColors.black, bg = defaultColors.red } },

  inactive = {
    a = { fg = defaultColors.white, bg = colors.gruv_bg },
    b = { fg = defaultColors.white, bg = colors.gruv_bg },
    c = { fg = defaultColors.black, bg = colors.gruv_bg },
  },
}

require("lualine").setup({
  options = {
    theme = bubbles_theme,
    component_separators = "",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = "" }, right_padding = 2 },
    },
    lualine_b = {
      {
        "filename",
        file_status = true, -- Displays file status (readonly status, modified status)
        path = 1, -- 0: Just the filename
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory

        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = "[+]", -- Text to show when the file is modified.
          readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
          unnamed = "[No Name]", -- Text to show for unnamed buffers.
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
