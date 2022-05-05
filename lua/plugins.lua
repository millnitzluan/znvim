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
	use({
		"mnabila/gruvboy.nvim",
		requires = { "rktjmp/lush.nvim" },
	})

	use("christoomey/vim-tmux-navigator")
	use("nvim-lua/plenary.nvim")
	use("tpope/vim-surround")
	use({ "folke/lua-dev.nvim" })

	-- Lua
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})

	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					local gs = package.loaded.gitsigns

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Actions
					-- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
					-- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
					-- map('n', '<leader>hS', gs.stage_buffer)
					-- map('n', '<leader>hu', gs.undo_stage_hunk)
					-- map('n', '<leader>hR', gs.reset_buffer)
					-- map('n', '<leader>hp', gs.preview_hunk)
					map("n", "<leader>hb", function()
						gs.blame_line({ full = true })
					end)
					-- map('n', '<leader>tb', gs.toggle_current_line_blame)
					-- map('n', '<leader>hd', gs.diffthis)
					-- map('n', '<leader>hD', function() gs.diffthis('~') end)
					-- map('n', '<leader>td', gs.toggle_deleted)
					--
					-- Text object
					-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
				end,
			})
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

	use({
		"neovim/nvim-lspconfig",
		requires = { "williamboman/nvim-lsp-installer" },
		config = function()
			require("plugins.lsp")
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
		"kdheepak/tabline.nvim",
		config = function()
			require("plugins.tabline")
		end,
		requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
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
