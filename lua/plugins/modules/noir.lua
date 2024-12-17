return {
  'jesseleite/nvim-noirbuddy',
  dependencies = {
    { 'tjdevries/colorbuddy.nvim' }
  },
  lazy = false,
  priority = 1000,
  enabled = true,
  opts = {
    preset = 'minimal',
    styles = {
      italic = true,
      undercurl = true,
    },
  },
  config = function()
    -- require("jellybeans").setup()
    -- vim.cmd.colorscheme("jellybeans")
  end
}
