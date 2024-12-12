return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = false,
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
  opts = {
    options = {
      -- theme = "catppuccin",
      component_separators = "",
      section_separators = "",
    },
    sections = {
      lualine_c = {
        "%=",
        {
          "filetype",
          icon_only = true,
          icon = { align = "right" },
        },
        {
          "filename",
          file_status = false,
          path = 1,
        },
      },
    }
  }
}
