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
	use 'wbthomason/packer.nvim'

	use 'morhetz/gruvbox'
	use 'christoomey/vim-tmux-navigator'
	use { 
		'kyazdani42/nvim-web-devicons', 
		event = 'VimEnter',
		config = function()
			require("plugins.icons")
		end,
	}

	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons',
		},
		config = function()
			require("plugins.nvim-tree")
		end,
	}

	use {
		"nvim-lua/plenary.nvim",
	}

	use {
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require("plugins.telescope")
		end,
	}

	use {
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	}

	use "neovim/nvim-lspconfig"
	use "jose-elias-alvarez/null-ls.nvim"
end

-- load plugins
return require("packer").startup(startup)
