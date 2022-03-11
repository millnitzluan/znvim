-- bootstrap Packer
local packer_path = "/site/pack/packer/start/packer.nvim"
local install_path = vim.fn.stdpath("data") .. packer_path
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	local repo = "https://github.com/wbthomason/packer.nvim"
	local clone = { "git", "clone", "--depth", "1", repo, install_path }
	PackerBboostraped = vim.fn.system(clone)
end

vim.cmd([[packadd packer.nvim]])

if PackerBboostraped then
	require("packer").sync()
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- add plugins
local startup = function(use)
	use("wbthomason/packer.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("christoomey/vim-tmux-navigator")
	use("nvim-lua/plenary.nvim")
	use("tpope/vim-surround")
	use({ "folke/lua-dev.nvim" })

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	-- Snippet engine
	use({
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip/loaders/from_vscode").lazy_load()
		end,
		requires = {
			-- Snippet collections
			"rafamadriz/friendly-snippets",
		},
	})

	-- Completion engine
	use({
		"hrsh7th/nvim-cmp",
		event = "BufRead",
		config = function()
			require("plugins.cmp")
		end,
	})

	-- Snippet completion source
	use({
		"saadparwaiz1/cmp_luasnip",
		after = "nvim-cmp",
	})

	-- Buffer completion source
	use({
		"hrsh7th/cmp-buffer",
		after = "nvim-cmp",
	})

	-- Path completion source
	use({
		"hrsh7th/cmp-path",
		after = "nvim-cmp",
	})

	-- LSP completion source
	use({
		"hrsh7th/cmp-nvim-lsp",
	})

	-- use({
	-- 	"hrsh7th/nvim-cmp",
	-- 	requires = {
	-- 		"onsails/lspkind-nvim",
	-- 		"hrsh7th/cmp-buffer",
	-- 		"hrsh7th/cmp-nvim-lsp",
	-- 		"hrsh7th/cmp-path",
	-- 		"hrsh7th/cmp-nvim-lua",
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 	},
	-- 	config = function()
	-- 		require("plugins.cmp")
	-- 	end,
	-- })
	--
	use({
		"neovim/nvim-lspconfig",
		requires = { "williamboman/nvim-lsp-installer" },
		config = function()
			require("plugins.lsp")
		end,
	})

	use({
		"kyazdani42/nvim-web-devicons",
		event = "VimEnter",
		config = function()
			require("plugins.icons")
		end,
	})

	use({ "jose-elias-alvarez/null-ls.nvim" })

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("plugins.nvim-tree")
		end,
	})

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("plugins.telescope")
		end,
	})

	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		event = "BufRead",
		cmd = {
			"TSInstall",
			"TSInstallInfo",
			"TSInstallSync",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
			"TSDisableAll",
			"TSEnableAll",
		},
		config = function()
			require("plugins.treesitter")
		end,
		requires = {
			{
				-- Parenthesis highlighting
				"p00f/nvim-ts-rainbow",
				after = "nvim-treesitter",
			},
			{
				-- Autoclose tags
				"windwp/nvim-ts-autotag",
				after = "nvim-treesitter",
			},
			{
				-- Context based commenting
				"JoosepAlviste/nvim-ts-context-commentstring",
				after = "nvim-treesitter",
			},
		},
	})
end

-- load plugins
return require("packer").startup(startup)
