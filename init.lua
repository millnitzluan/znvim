vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.keymaps")
require("config.options")
require("config.autocmds")
-- require('config.theme').setup()
require("plugins")
vim.cmd([[colorscheme tokyonight-night]])
