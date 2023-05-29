return {
  -- comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    config = function()
      require('Comment').setup()
    end
  }
}
