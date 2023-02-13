local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  "wbthomason/packer.nvim",
  "nvim-lua/plenary.nvim",
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",
  "kyazdani42/nvim-web-devicons",
  "kyazdani42/nvim-tree.lua",
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  "nvim-lualine/lualine.nvim",
  "lewis6991/impatient.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "goolord/alpha-nvim",
  "dstein64/vim-startuptime",
  "christoomey/vim-tmux-navigator",
  "tpope/vim-surround",
  { "folke/which-key.nvim", lazy = false },

  -- Colorschemes
  "folke/tokyonight.nvim",
  "LunarVim/horizon.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",

  -- snippets
  "L3MON4D3/LuaSnip",
  "rafamadriz/friendly-snippets",

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "RRethy/vim-illuminate",

  -- Telescope
  "nvim-telescope/telescope.nvim",

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",

  -- Git
  "lewis6991/gitsigns.nvim",
}
