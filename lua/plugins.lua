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
	use("neovim/nvim-lspconfig")
	use("tpope/vim-surround")

	use({
		"kyazdani42/nvim-web-devicons",
		event = "VimEnter",
		config = function()
			require("plugins.icons")
		end,
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("plugins.null-ls")
		end,
	})

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
