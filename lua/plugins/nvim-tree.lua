local g = vim.g

require("nvim-tree").setup({
  filters = {
    dotfiles = false,
    custom = {
      ".git",
      "node_modules",
      ".cache",
    },
  },
  renderer = {
    icons = {
      glyphs = {
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "➜",
          untracked = "",
          deleted = " ",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          symlink = "",
          empty = "",
          empty_open = "",
          symlink_open = "",
        },
      },
    },
  },
  disable_netrw = true,
  hijack_netrw = true,
  ignore_ft_on_setup = {
    "dashboard",
    "startify",
    "alpha",
  },
  open_on_tab = false,
  hijack_cursor = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = {},
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 50,
    height = 30,
    side = "left",
    -- allow_resize = true,
    hide_root_folder = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 500,
  },
})
