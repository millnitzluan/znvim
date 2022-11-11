vim.cmd([[
  set background=dark
  set termguicolors
  colorscheme megaforest
]])

vim.opt.termguicolors = true
vim.o.background = "dark"

vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.syntax = "on"
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.smartindent = false

vim.g.laststatus = 3

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.swapfile = false

vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

vim.g.mapleader = " "
vim.g.cursorhold_updatetime = 100

_G.mega = mega
    or {
      fn = {},
      dirs = {},
      mappings = {},
      term = {},
      lsp = {},
      colors = require("plugins.lush_theme.colors"),
      icons = require("plugins.icons"),
      -- original vim.notify: REF: https://github.com/folke/dot/commit/b0f6a2db608cb090b969e2ef5c018b86d11fc4d6
      notify = vim.notify,
    }

require("plugins.globals")
require("plugins.megaline")

require("plugins")
require("keymaps")
