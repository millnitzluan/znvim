return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local Util = require("lazyvim.util")
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    local icons = require("lazyvim.config").icons

    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { { "branch", icon = "" } },

        lualine_c = {
          Util.lualine.root_dir(),
          {
            "diagnostics",
            symbols = {
              error = icons.diagnostics.Error,
              warn = icons.diagnostics.Warn,
              info = icons.diagnostics.Info,
              hint = icons.diagnostics.Hint,
            },
          },
          { "filetype",                icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { Util.lualine.pretty_path() },
        },
        lualine_x = {
          -- stylua: ignore
          {
            ---@diagnostic disable-next-line: undefined-field
            function() return require("noice").api.status.command.get() end,
            ---@diagnostic disable-next-line: undefined-field
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = Util.ui.fg("Statement"),
          },
          -- stylua: ignore
          {
            ---@diagnostic disable-next-line: undefined-field
            function() return require("noice").api.status.mode.get() end,
            ---@diagnostic disable-next-line: undefined-field
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = Util.ui.fg("Constant"),
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = Util.ui.fg("Debug"),
          },
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = Util.ui.fg("Special"),
          },
          {
            "diff",
            symbols = {
              added = icons.git.added,
              modified = icons.git.modified,
              removed = icons.git.removed,
            },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          { "location", icon = "", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }
  end,
}
-- return {
--   "nvim-lualine/lualine.nvim",
--   dependencies = {
--     "meuter/lualine-so-fancy.nvim",
--   },
--   enabled = true,
--   lazy = false,
--   event = { "BufReadPost", "BufNewFile", "VeryLazy" },
--   config = function()
--     require("lualine").setup({
--       options = {
--         theme = "auto",
--         globalstatus = true,
--         icons_enabled = true,
--         component_separators = { left = "|", right = "|" },
--         section_separators = { left = "", right = "" },
--         disabled_filetypes = {
--           statusline = {
--             "alfa-nvim",
--             "help",
--             "neo-tree",
--             "Trouble",
--             "spectre_panel",
--             "toggleterm",
--           },
--           winbar = {},
--         },
--       },
--       sections = {
--         lualine_a = {},
--         lualine_b = {
--           "fancy_branch",
--         },
--         lualine_c = {
--           {
--             "filename",
--             path = 1, -- 2 for full path
--             symbols = {
--               modified = "  ",
--               -- readonly = "  ",
--               -- unnamed = "  ",
--             },
--           },
--           { "fancy_diagnostics", sources = { "nvim_lsp" }, symbols = { error = " ", warn = " ", info = " " } },
--           { "fancy_searchcount" },
--         },
--         lualine_x = {
--           "fancy_lsp_servers",
--           "fancy_diff",
--           "progress",
--         },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = { "filename" },
--         -- lualine_x = { "location" },
--         lualine_y = {},
--         lualine_z = {},
--       },
--       tabline = {},
--       extensions = { "neo-tree", "lazy" },
--     })
--   end,
-- }
