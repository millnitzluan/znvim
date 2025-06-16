vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.keymaps")
require("config.options")
require("config.autocmds")
require("plugins")

vim.cmd([[colorscheme gruvbox-material]])
