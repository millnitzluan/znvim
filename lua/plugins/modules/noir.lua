return {
  'jesseleite/nvim-noirbuddy',
  dependencies = {
    { 'tjdevries/colorbuddy.nvim' }
  },
  lazy = false,
  priority = 1000,
  enabled = true,
  opts = {
    preset = 'miami-nights',
    styles = {
      italic = true,
      undercurl = true,
    },
  },
}
