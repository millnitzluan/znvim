vim.opt.termguicolors = true
vim.o.background = "dark"

-- vim.cmd([[colorscheme onedark]])

-- require("onenord").setup({
-- 	-- options = {
-- 	theme = "dark",
-- 	borders = true,
-- 	fade_nc = false,
-- 	-- },
-- })

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require("catppuccin").setup()

vim.cmd([[colorscheme catppuccin]])

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

require("plugins")
require("keymaps")
