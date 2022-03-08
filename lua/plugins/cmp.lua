-- nvim-cmp configs
local cmp = require("cmp")
local compare = require("cmp.config.compare")

local lspkind = require("lspkind")
lspkind.init()

cmp.setup({
	experimental = {
		ghost_test = false,
		native_menu = false,
	},
	sources = {
		{ name = "gh_issues" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol",
			maxwidth = 50,
			menu = {
				nvim_lua = "[lua-api]",
				nvim_lsp = "[lsp]",
				path = "[path]",
				buffer = "[buf]",
				gh_issues = "[issue]",
			},
		}),
	},
	mapping = {
		["<tab>"] = cmp.mapping.select_next_item(),
	},
	sorting = {
		comparators = {
			compare.kind,
			compare.offset,
			compare.exact,
			compare.score,
			compare.sort_text,
			compare.length,
			compare.order,
		},
	},
})

vim.cmd([[
  augroup DadbodSql
    au!
    autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }
  augroup END
]])
