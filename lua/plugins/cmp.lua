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
		["<tab>"] = cmp.config.disable,
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-e>"] = cmp.mapping.close(),
		["<C-y>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}, { "i", "c" }),
		["<C-Space>"] = cmp.mapping({
			i = cmp.mapping.complete(),
			c = function(_)
				if cmp.visible() then
					if not cmp.confirm({ select = true }) then
						return
					end
				else
					cmp.complete()
				end
			end,
		}),
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
