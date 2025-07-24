-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
local opts = { noremap = true, silent = true }

map("n", "<C-n>", ":bnext<CR>", opts)
map("n", "<C-p>", ":bprevious<CR>", opts)
