local actions = require("telescope.actions")
require("telescope").load_extension("fzf")

local default_mappings = {
  n = {
    ["Q"] = actions.smart_add_to_qflist + actions.open_qflist,
    ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
    ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
    ["v"] = actions.file_vsplit,
    ["s"] = actions.file_split,
    ["<cr>"] = actions.file_edit,
    ["q"] = actions.close,
  },
}

require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", "yarn.lock" },
    scroll_strategy = "limit",
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
      },
    },
  },
  pickers = {
    buffers = {
      theme = "ivy",
      prompt_title = "Search Buffers",
      mappings = vim.tbl_deep_extend("force", {
        i = {
          ["<C-x>"] = actions.delete_buffer,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,

          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,

          ["<C-c>"] = actions.close,
        },
        n = {
          ["d"] = actions.delete_buffer,

          ["<CR>"] = actions.select_default + actions.center,

          ["<C-x>"] = actions.delete_buffer,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,

          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["<S-up>"] = actions.preview_scrolling_up,
          ["<S-down>"] = actions.preview_scrolling_down,
          ["<C-up>"] = actions.preview_scrolling_up,
          ["<C-down>"] = actions.preview_scrolling_down,

          ["<C-u>"] = actions.move_to_top,
          ["<C-d>"] = actions.move_to_middle,
          ["<C-b>"] = actions.move_to_top,
          ["<C-f>"] = actions.move_to_bottom,

          ["<C-q>"] = actions.send_to_qflist,
          ["<M-q>"] = actions.send_to_qflist + actions.open_qflist,

          ["<C-c>"] = actions.close,
          ["<esc>"] = actions.close,
        },
      }, default_mappings),
      sort_mru = true,
      preview_title = false,
    },
    find_files = {
      theme = "dropdown",
    },
    oldfiles = {
      theme = "ivy",
    },
    live_grep = {
      theme = "dropdown",
    },
  },
  extensions = {
    fzf = {
      override_generic_sorter = false,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})
