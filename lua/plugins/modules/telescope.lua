return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    -- version = '0.1.0',
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
      },
    },
    config = function()
      local telescope = require("telescope")
      local telescopeConfig = require("telescope.config")
      local _actions_setup, actions = pcall(require, "telescope.actions")

      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, "--hidden")
      -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, "--glob")
      table.insert(vimgrep_arguments, "!**/.git/*")

      telescope.setup({
        defaults = {
          previewer = false,
          hidden = true,
          -- `hidden = true` is not supported in text grep commands.
          vimgrep_arguments = vimgrep_arguments,
          file_ignore_patterns = { "node_modules", "package-lock.json" },
          initial_mode = "insert",
          select_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.5,
            height = 0.4,
            prompt_position = "top",
            preview_cutoff = 120,
          },
          mappings = {
            n = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
              ["<C-p>"] = actions.send_selected_to_qflist + actions.open_qflist,
            },
          },
        },
        pickers = {
          find_files = {
            previewer = false,
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
          },
          git_files = {
            previewer = false,
          },
          buffers = {
            previewer = false,
          },
          live_grep = {
            only_sort_text = true,
            previewer = true,
            layout_config = {
              horizontal = {
                width = 0.9,
                height = 0.75,
                preview_width = 0.6,
              },
            },
          },
          grep_string = {
            only_sort_text = true,
            previewer = true,
            layout_config = {
              horizontal = {
                width = 0.9,
                height = 0.75,
                preview_width = 0.6,
              },
            },
          },
          lsp_references = {
            show_line = false,
            previewer = true,
            layout_config = {
              horizontal = {
                width = 0.9,
                height = 0.75,
                preview_width = 0.6,
              },
            },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              previewer = false,
              initial_mode = "normal",
              sorting_strategy = "ascending",
              layout_strategy = "horizontal",

              layout_config = {
                horizontal = {
                  width = 0.9,
                  height = 0.75,
                  preview_width = 0.6,
                },
              },
              -- layout_config = {
              --   horizontal = {
              --     width = 0.5,
              --     height = 0.4,
              --     preview_width = 0.6,
              --   },
              -- },
            }),
          },
        },
      })

      vim.keymap.set(
        "n",
        "<leader>sd",
        require("telescope").extensions.live_grep_args.live_grep_args,
        { noremap = true }
      )
      telescope.load_extension("fzf")
    end,
  },
}
