-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
local opts = { noremap = true, silent = true }

map("n", "<C-n>", ":bnext<CR>", opts)
map("n", "<C-p>", ":bprevious<CR>", opts)

-- Custom command to open Cursor
vim.api.nvim_create_user_command("Cursor", function()
  local file = vim.fn.expand("%") -- Get relative path of current file
  
  if file == "" then
    vim.notify("No file currently open", vim.log.levels.WARN)
    return
  end
  
  -- Open Cursor with the current file
  local cmd = string.format("cursor %s", vim.fn.shellescape(file))
  vim.fn.jobstart(cmd, { 
    shell = true,
    detach = true,
  })
  vim.notify(string.format("Opening %s in Cursor", vim.fn.expand("%:t")))
end, { desc = "Open current file in Cursor" })
