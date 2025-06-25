return {
  "nvimtools/none-ls.nvim",
  lazy = false,
  enabled = true,
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      debug = false,
      sources = {
        -- Formatters
        formatting.prettier,
        formatting.terraform_fmt,
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
				require("none-ls.diagnostics.eslint_d")

        -- Linters & diagnostics
        -- diagnostics.eslint.with({
        --   only_local = "node_modules/.bin",
        -- }),
        --
        -- -- Code actions
        -- code_actions.eslint.with({
        --   only_local = "node_modules/.bin",
        -- }),
      },
    })
  end,
}
