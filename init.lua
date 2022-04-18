vim.opt.termguicolors = true
vim.o.background = "dark"
vim.cmd([[colorscheme gruvboy]])

vim.o.fileencoding = "utf-8"
vim.o.syntax = "on"
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.smartindent = true

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.swapfile = false

vim.o.scrolloff = 10
vim.o.sidescrolloff = 10

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

require("plugins")
require("keymaps")
