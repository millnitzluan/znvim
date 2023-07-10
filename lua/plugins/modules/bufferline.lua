return {
  {
    "akinsho/bufferline.nvim",
    enabled = true,
    event = "VimEnter",
    lazy = true,
    config = function()
      local bufferline = require("bufferline")
      bufferline.setup({
        options = {
          style_preset = bufferline.style_preset.minimal,
          show_buffer_close_icons = false,
        },
      })
    end,
  },
}
