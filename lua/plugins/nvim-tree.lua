local g = vim.g

g.nvim_tree_indent_markers = 1

require("nvim-tree").setup({
	filters = {
		dotfiles = false,
		custom = {
			".git",
			"node_modules",
			".cache",
		},
	},
	disable_netrw = true,
	hijack_netrw = true,
	ignore_ft_on_setup = {
		"dashboard",
		"startify",
		"alpha",
	},
	-- auto_close = true,
	open_on_tab = false,
	quit_on_open = false,
	hijack_cursor = true,
	hide_root_folder = true,
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 50,
		height = 30,
		side = "left",
		allow_resize = true,
		hide_root_folder = false,
		number = false,
		relativenumber = false,
		signcolumn = "yes",
	},
	git = {
		enable = true,
		ignore = false,
		timeout = 500,
	},
})
