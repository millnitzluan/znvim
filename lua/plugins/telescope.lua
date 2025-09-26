return {
  "nvim-telescope/telescope.nvim",
  defaults = {
    -- ... other default options ...
    layout_config = {
      prompt_position = "bottom", -- or "top" if that's what you mean
      -- other layout_config options, e.g.:
      width = 0.9,
      height = 0.8,
      preview_cutoff = 1, -- Ensure preview is always shown
    },
    -- ... other options ...
  },
  -- defaults = {
  --   results_title = false,
  --   sorting_strategy = "ascending",
  --   layout_strategy = "center",
  --   layout_config = {
  --     preview_cutoff = 1, -- Preview should always show (unless previewer = false)
  --     width = function(_, max_columns, _)
  --       return math.min(max_columns, 80)
  --     end,
  --     height = function(_, _, max_lines)
  --       return math.min(max_lines, 15)
  --     end,
  --   },
  --   border = true,
  --   borderchars = {
  --     prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
  --     results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
  --     preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
  --   },
  -- },
  -- opts = {
  --   defaults = {
  --     layout_strategy = "vertical",
  --     layout_config = {
  --       prompt_position = "top",
  --       preview_cutoff = 0,
  --       vertical = {
  --         preview_height = 0.5,
  --       },
  --     },
  --     sorting_strategy = "ascending",
  --   },
  -- },
  keys = {
    -- add a keymap to browse plugin files
    -- stylua: ignore
    {
      "<leader>fj",
      function() require("telescope.builtin").find_files() end,
      desc = "Find Plugin File",
    },
  },
}
