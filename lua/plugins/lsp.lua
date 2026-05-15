return {
  -- Disable default tsserver (we'll use typescript-tools instead)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = { enabled = false },
        ts_ls = { enabled = false },
        -- CSS Modules support
        cssmodules_ls = {},
        -- CSS/SCSS
        cssls = {},
        -- Tailwind (if you use it)
        tailwindcss = {
          filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
      },
      inlay_hints = { enabled = false },
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
      },
    },
  },

  -- typescript-tools: Faster TypeScript LSP
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    opts = {
      settings = {
        separate_diagnostic_server = true,
        publish_diagnostic_on = "insert_leave",
        tsserver_max_memory = 4096,
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayParameterNameHintsWhenArgumentMatchesName = false,
          includeInlayFunctionParameterTypeHints = true,
          includeInlayVariableTypeHints = true,
          includeInlayVariableTypeHintsWhenTypeMatchesName = false,
          includeInlayPropertyDeclarationTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeInlayEnumMemberValueHints = true,
          includeCompletionsForModuleExports = true,
          quotePreference = "auto",
        },
        tsserver_format_options = {
          allowIncompleteCompletions = false,
          allowRenameOfImportPath = false,
        },
      },
    },
    keys = {
      { "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", desc = "Organize Imports" },
      { "<leader>cs", "<cmd>TSToolsSortImports<cr>", desc = "Sort Imports" },
      { "<leader>cu", "<cmd>TSToolsRemoveUnusedImports<cr>", desc = "Remove Unused Imports" },
      { "<leader>cd", "<cmd>TSToolsGoToSourceDefinition<cr>", desc = "Go to Source Definition" },
      { "<leader>cR", "<cmd>TSToolsRenameFile<cr>", desc = "Rename File" },
      { "<leader>cf", "<cmd>TSToolsFixAll<cr>", desc = "Fix All" },
      { "<leader>ci", "<cmd>TSToolsAddMissingImports<cr>", desc = "Add Missing Imports" },
    },
  },

  -- LSP progress indicator
  {
    "j-hui/fidget.nvim",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },
}
