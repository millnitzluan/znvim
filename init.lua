require "user.plugins"

vim.cmd.colorscheme "catppuccin-mocha"

require "user.impatient"
require "user.options"
require "user.keymaps"
require "user.autocommands"
require "user.fidget"
require "user.cmp"
require "user.telescope"
require "user.gitsigns"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.illuminate"
require "user.indentline"
require "user.lsp"

require("fidget").setup {}

require("filetype").setup {
  overrides = {
    extensions = {
      tf = "terraform",
      tfvars = "terraform",
      tfstate = "json",
    },
  },
}
