return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    dependencies = {
        { 'echasnovski/mini.icons' },
    },
    opts = {
        plugins = {
            marks = false,     -- shows a list of your marks on ' and `
            registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true,
                suggestions = 20,
            },
            presets = {
                -- operators = false,    -- adds help for operators like d, y, ...
                motions = false,      -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = false,      -- default bindings on <c-w>
                nav = false,          -- misc bindings to work with windows
                z = false,            -- bindings for folds, spelling and others prefixed with z
                g = false,            -- bindings for prefixed with g
            },
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        layout = {
            height = { min = 4, max = 25 },                                           -- min and max height of the columns
            width = { min = 20, max = 50 },                                           -- min and max width of the columns
            spacing = 3,                                                              -- spacing between columns
            align = "left",                                                           -- align columns left, center or right
        },
        show_help = true,                                                             -- show help message on the command line when the popup is visible
        show_keys = true,
        disable = {
            buftypes = {},
            filetypes = { "TelescopePrompt" },
        },
    },
    config = function(_, opts)
        local which_key = require("which-key")
        which_key.setup(opts)
        which_key.add(require("config.which_key_defaults"), {
            mode = "n",
            prefix = "<leader>",
        })

        which_key.add(require("config.which_key_non_leader"))
    end,
}
