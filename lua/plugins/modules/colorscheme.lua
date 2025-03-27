-- tokyonight Theme
return {
	-- https://github.com/tokyonight/nvim
	"olimorris/onedarkpro.nvim",
	lazy = false,
	priority = 1000,
	enabled = false,
	opts = {},
	config = function(_, opts)
		-- require('onedark').setup {
		-- 	-- style = 'warmer'
		-- }
		vim.cmd("colorscheme onedark") -- Replace this with your favorite colorscheme
	end,
}
