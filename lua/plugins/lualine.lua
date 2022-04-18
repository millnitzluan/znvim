local colors = {
	blue = "#80a0ff",
	cyan = "#79dac8",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ff5189",
	violet = "#d183e8",
	grey = "#303030",
	-- gruv_bg = "#282828",
	gruv_bg = "#252525",
	-- gruv_bg_dark = "#252525",
	gruv_bg_dark = "#282828",
}

local bubbles_theme = {
	normal = {
		a = { fg = colors.white, bg = colors.gruv_bg_dark },
		b = { fg = colors.white, bg = colors.gruv_bg_dark },
		c = { fg = colors.black, bg = colors.gruv_bg },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.gruv_bg },
		b = { fg = colors.white, bg = colors.gruv_bg },
		c = { fg = colors.black, bg = colors.gruv_bg },
	},
}

require("lualine").setup({
	options = {
		theme = bubbles_theme,
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{ "mode", separator = { left = "" }, right_padding = 2 },
		},
		lualine_b = { "filename", "branch" },
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
