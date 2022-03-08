vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.o.syntax = "on"
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"

vim.o.tabstop = 2
vim.o.shiftwidth = 2

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

require("plugins")
require("keymaps")
