return {
  -- comments
  { "JoosepAlviste/nvim-ts-context-commentstring", lazy = true },
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
    lazy = false,
    config = function()
      require('Comment').setup({ pre_hook = require('ts_context_commentstring.integrations.comment_nvim')
      .create_pre_hook(), })
    end
  }
}
