return {
  "jose-elias-alvarez/null-ls.nvim",
  lazy = false,
  config = function()
    -- NULL-LS
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      debug = false,
      sources = {
        formatting.prettierd,
        formatting.terraform_fmt,
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        formatting.rubocop,
        formatting.google_java_format,
        diagnostics.flake8,
        diagnostics.eslint_d,
        diagnostics.rubocop,
      },
    })
  end,
}
