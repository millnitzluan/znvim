return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    dependencies = {
      "windwp/nvim-ts-autotag",
    },
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
      end
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        -- autotag = {
        --   enable = true,
        --   enable_rename = true,
        --   enable_close = true,
        --   enable_close_on_slash = true,
        -- },
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 240 * 1024
            local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        auto_install = true,
        ensure_installed = {
          "bash",
          "html",
          "javascript",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "regex",
          "tsx",
          "typescript",
          "vim",
          "yaml",
          "ruby",
          "rust",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<leader>vv",
            node_incremental = "+",
            scope_incremental = false,
            node_decremental = "_",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = { query = "@function.outer", desc = "around a function" },
              ["if"] = { query = "@function.inner", desc = "inner part of a function" },
              ["ac"] = { query = "@class.outer", desc = "around a class" },
              ["ic"] = { query = "@class.inner", desc = "inner part of a class" },
              ["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
              ["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
              ["al"] = { query = "@loop.outer", desc = "around a loop" },
              ["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
              ["ap"] = { query = "@parameter.outer", desc = "around parameter" },
              ["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
            },
            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@parameter.inner"] = "v", -- charwise
              ["@function.outer"] = "v", -- charwise
              ["@conditional.outer"] = "V", -- linewise
              ["@loop.outer"] = "V", -- linewise
              ["@class.outer"] = "<c-v>", -- blockwise
            },
            include_surrounding_whitespace = false,
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_previous_start = {
              ["[f"] = { query = "@function.outer", desc = "Previous function" },
              ["[c"] = { query = "@class.outer", desc = "Previous class" },
              ["[p"] = { query = "@parameter.inner", desc = "Previous parameter" },
            },
            goto_next_start = {
              ["]f"] = { query = "@function.outer", desc = "Next function" },
              ["]c"] = { query = "@class.outer", desc = "Next class" },
              ["]p"] = { query = "@parameter.inner", desc = "Next parameter" },
            },
          },
        },
      })

      require("nvim-ts-autotag").setup({
        -- Defaults
        enable = true,
        filetypes = {
          "html",
          "javascriptreact",
          "javascript",
          "typescript",
          "typescriptreact",
          "tsx",
          "jsx",
        },
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </
        -- Also override individual filetype configs, these take priority.
        -- Empty by default, useful if one of the "opts" global settings
        -- doesn't work well in a specific filetype
        per_filetype = {
          ["html"] = {
            enable_close = false,
          },
        },
      })
    end,
  },
}
