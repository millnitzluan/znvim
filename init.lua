vim.opt.termguicolors = true
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

vim.o.fileencoding = "utf-8" -- File content encoding for the buffer
vim.o.syntax = "on"
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.smartindent = true -- Do auto indenting when starting a new line

vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true -- Enable the use of space in tab

vim.o.swapfile = false -- Disable use of swapfile for the buffer

vim.o.scrolloff = 10 -- Number of lines to keep above and below the cursor
vim.o.sidescrolloff = 10 -- Number of columns to keep at the sides of the cursor

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "

require("plugins")
require("keymaps")
