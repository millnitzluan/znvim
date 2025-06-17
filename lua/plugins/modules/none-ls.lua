return {
  "nvimtools/none-ls.nvim",
  lazy = false,
  enabled = false,
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    -- NULL-LS
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    -- Set eslint_d as default linter

    -- null_ls.builtins.diagnostics.eslint_d.with({
    --   only_local = "node_modules/.bin"
    -- })

    -- Set eslint_d as default code actions

    -- null_ls.builtins.code_actions.eslint_d.with({
    --   only_local = "node_modules/.bin"
    -- })

    null_ls.setup({
      debug = false,
      sources = {
        formatting.prettier,
        -- formatting.biome.with({
        --   prefer_local = "node_modules/.bin",
        --   cwd = function(params)
        --     return vim.fn.getcwd()
        --   end,
        -- }),
        formatting.terraform_fmt,
        formatting.black.with({ extra_args = { "--fast" } }),
        formatting.stylua,
        -- diagnostics.flake8,
        -- diagnostics.biome,
        -- diagnostics.eslint_d,
        require("none-ls.diagnostics.eslint"),
      },
    })
  end,
}
