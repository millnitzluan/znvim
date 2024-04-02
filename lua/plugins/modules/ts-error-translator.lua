return {
  "dmmulroy/ts-error-translator.nvim",
  lazy = false,
  enabled = true,
  opts = {
    -- custom options here
  },
  config = function()
    require("ts-error-translator").setup()
  end,
}
