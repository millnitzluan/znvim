local colors = {
  white = "#D9D7D6",
  darker_black = "#000a0e",
  black = "#061115",
  black2 = "#0d181c",
  one_bg = "#131e22",
  one_bg2 = "#1c272b",
  one_bg3 = "#242f33",
  grey = "#313c40",
  grey_fg = "#3b464a",
  grey_fg2 = "#455054",
  light_grey = "#4f5a5e",
  red = "#DF5B61",
  baby_pink = "#EE6A70",
  pink = "#F16269",
  line = "#222d31",
  green = "#78B892",
  vibrant_green = "#8CD7AA",
  nord_blue = "#5A84BC",
  blue = "#6791C9",
  yellow = "#ecd28b",
  sun = "#f6dc95",
  purple = "#C488EC",
  dark_purple = "#BC83E3",
  teal = "#7ACFE4",
  orange = "#E89982",
  cyan = "#67AFC1",
  statusline_bg = "#0A1519",
  lightbg = "#1a2529",
  pmenu_bg = "#78B892",
  folder_bg = "#6791C9",
}

local theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue, gui = "bold" },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black2 }
  },
  insert = {
    a = { fg = colors.black, bg = colors.green, gui = "bold" },
    b = { fg = colors.white, bg = colors.grey }
  },
  visual = {
    a = { fg = colors.black, bg = colors.purple, gui = "bold" },
    b = { fg = colors.white, bg = colors.grey }
  },
  replace = {
    a = { fg = colors.black, bg = colors.red, gui = "bold" },
    b = { fg = colors.white, bg = colors.grey }
  },
  command = {
    a = { fg = colors.black, bg = colors.yellow, gui = "bold" },
    b = { fg = colors.white, bg = colors.grey }
  },
  inactive = {
    a = { fg = colors.white, bg = colors.black2, gui = "bold" },
    b = { fg = colors.white, bg = colors.black2 },
    c = { fg = colors.black, bg = colors.black }
  }
}

-- Définition des highlights
local function set_highlights()
  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- UI Elements
  hi("Normal", { fg = colors.white, bg = colors.black })
  hi("NormalFloat", { fg = colors.white, bg = colors.black2 })
  hi("FloatBorder", { fg = colors.blue, bg = colors.black2 })
  hi("ColorColumn", { bg = colors.black2 })
  hi("Cursor", { fg = colors.black, bg = colors.white })
  hi("CursorLine", { bg = colors.one_bg })
  hi("CursorLineNr", { fg = colors.white, bold = true })
  hi("LineNr", { fg = colors.grey })
  hi("Directory", { fg = colors.blue })
  hi("DiffAdd", { fg = colors.green })
  hi("DiffChange", { fg = colors.yellow })
  hi("DiffDelete", { fg = colors.red })
  hi("DiffText", { fg = colors.blue })

  -- Syntax
  hi("Comment", { fg = colors.grey_fg, italic = true })
  hi("Constant", { fg = colors.orange })
  hi("String", { fg = colors.green })
  hi("Character", { fg = colors.green })
  hi("Number", { fg = colors.orange })
  hi("Boolean", { fg = colors.orange })
  hi("Float", { fg = colors.orange })
  hi("Identifier", { fg = colors.red })
  hi("Function", { fg = colors.blue })
  hi("Statement", { fg = colors.purple })
  hi("Conditional", { fg = colors.purple })
  hi("Repeat", { fg = colors.purple })
  hi("Label", { fg = colors.purple })
  hi("Operator", { fg = colors.purple })
  hi("Keyword", { fg = colors.red })
  hi("Exception", { fg = colors.purple })
  hi("PreProc", { fg = colors.yellow })
  hi("Include", { fg = colors.purple })
  hi("Define", { fg = colors.purple })
  hi("Macro", { fg = colors.purple })
  hi("PreCondit", { fg = colors.yellow })
  hi("Type", { fg = colors.yellow })
  hi("StorageClass", { fg = colors.yellow })
  hi("Structure", { fg = colors.yellow })
  hi("Typedef", { fg = colors.yellow })
  hi("Special", { fg = colors.blue })
  hi("SpecialComment", { fg = colors.grey_fg })
  hi("Error", { fg = colors.red })
  hi("Todo", { fg = colors.purple, bold = true })

  -- Treesitter
  hi("TSAnnotation", { fg = colors.red })
  hi("TSAttribute", { fg = colors.yellow })
  hi("TSBoolean", { fg = colors.orange })
  hi("TSCharacter", { fg = colors.green })
  hi("TSComment", { fg = colors.grey_fg, italic = true })
  hi("TSConstructor", { fg = colors.blue })
  hi("TSConditional", { fg = colors.purple })
  hi("TSConstant", { fg = colors.orange })
  hi("TSConstBuiltin", { fg = colors.orange })
  hi("TSConstMacro", { fg = colors.orange })
  hi("TSError", { fg = colors.red })
  hi("TSException", { fg = colors.purple })
  hi("TSField", { fg = colors.blue })
  hi("TSFloat", { fg = colors.orange })
  hi("TSFunction", { fg = colors.blue })
  hi("TSFuncBuiltin", { fg = colors.blue })
  hi("TSFuncMacro", { fg = colors.blue })
  hi("TSInclude", { fg = colors.purple })
  hi("TSKeyword", { fg = colors.red })
  hi("TSKeywordFunction", { fg = colors.purple })
  hi("TSKeywordOperator", { fg = colors.purple })
  hi("TSLabel", { fg = colors.purple })
  hi("TSMethod", { fg = colors.blue })
  hi("TSNamespace", { fg = colors.yellow })
  hi("TSNumber", { fg = colors.orange })
  hi("TSOperator", { fg = colors.purple })
  hi("TSParameter", { fg = colors.red })
  hi("TSParameterReference", { fg = colors.red })
  hi("TSProperty", { fg = colors.blue })
  hi("TSPunctDelimiter", { fg = colors.white })
  hi("TSPunctBracket", { fg = colors.white })
  hi("TSPunctSpecial", { fg = colors.red })
  hi("TSRepeat", { fg = colors.purple })
  hi("TSString", { fg = colors.green })
  hi("TSStringRegex", { fg = colors.orange })
  hi("TSStringEscape", { fg = colors.orange })
  hi("TSSymbol", { fg = colors.blue })
  hi("TSTag", { fg = colors.red })
  hi("TSTagDelimiter", { fg = colors.grey })
  hi("TSText", { fg = colors.white })
  hi("TSStrong", { bold = true })
  hi("TSEmphasis", { italic = true })
  hi("TSUnderline", { underline = true })
  hi("TSStrike", { strikethrough = true })
  hi("TSTitle", { fg = colors.blue, bold = true })
  hi("TSLiteral", { fg = colors.green })
  hi("TSURI", { fg = colors.orange, underline = true })
  hi("TSType", { fg = colors.yellow })
  hi("TSTypeBuiltin", { fg = colors.yellow })
  hi("TSVariable", { fg = colors.white })
  hi("TSVariableBuiltin", { fg = colors.red })
end

local function setup()
  -- Désactive les highlights existants
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- Configure les options de base
  vim.o.termguicolors = true
  vim.o.background = "dark"

  -- Applique les highlights
  set_highlights()
end

return {
  setup = setup,
  colors = colors,
  theme = theme
}
