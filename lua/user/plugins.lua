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
  {
    "jinh0/eyeliner.nvim",
    config = function()
      require("eyeliner").setup {
        highlight_on_key = true, -- show highlights only after keypress
        dim = false, -- dim all other characters if set to true (recommended!)
      }
    end,
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
      require("lsp_lines").setup()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").setup {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        term_colors = true,
        transparent_background = false,
        no_italic = false,
        no_bold = false,
        styles = {
          comments = {},
          conditionals = {},
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
        },
        color_overrides = {
          -- mocha = {
          --   base = "#000000",
          --   mantle = "#000000",
          --   crust = "#000000",
          -- },
        },
        highlight_overrides = {
          mocha = function(C)
            return {
              TabLineSel = { bg = C.pink },
              CmpBorder = { fg = C.surface2 },
              Pmenu = { bg = C.none },
              TelescopeBorder = { link = "FloatBorder" },
            }
          end,
        },
      }

      vim.cmd.colorscheme "catppuccin"
    end,
  },

  "dstein64/vim-startuptime",
  "christoomey/vim-tmux-navigator",
  "tpope/vim-surround",
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end,
  },
  {
    "nathom/filetype.nvim",
    lazy = false,
    config = function()
      require("filetype").setup {
        overrides = {
          extensions = {
            tf = "terraform",
            tfvars = "terraform",
            tfstate = "json",
          },
        },
      }
    end,
  },
  {
    "anuvyklack/windows.nvim",
    dependencies = {
      "anuvyklack/middleclass",
      "anuvyklack/animation.nvim",
    },
    config = function()
      vim.o.winwidth = 10
      vim.o.winminwidth = 10
      vim.o.equalalways = false
      require("windows").setup()
    end,
  },

  -- Colorschemes
  "folke/tokyonight.nvim",
  "LunarVim/horizon.nvim",
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").setup {
        theme = "dragon",
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      }
    end,
  },

  -- cmp plugins
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",

      -- snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
  },

  -- LSP
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "jose-elias-alvarez/null-ls.nvim",
  "RRethy/vim-illuminate",
  "folke/neodev.nvim",
  { "j-hui/fidget.nvim", event = "BufEnter" },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "mitchellh/tree-sitter-hcl",
    },
  },

  -- Git
  "lewis6991/gitsigns.nvim",
}
