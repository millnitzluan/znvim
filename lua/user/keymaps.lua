-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "


vim.api.nvim_set_keymap('n', '<space>o', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

-- Normal --

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Vim Tmux Navigation / Better window navigation
keymap("n", "<C-h>", ":<C-U>TmuxNavigateLeft<CR>")
keymap("n", "<C-j>", ":<C-U>TmuxNavigateDown<CR>")
keymap("n", "<C-k>", ":<C-U>TmuxNavigateUp<CR>")
keymap("n", "<C-l>", ":<C-U>TmuxNavigateRight<CR>")

-- Navigate buffers
keymap("n", "<C-n>", ":bnext<CR>", opts)
keymap("n", "<C-p>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Close buffer without closing window
keymap("n", "<leader>d", ":Bdelete<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>st", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fk", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>/", ":Telescope buffers<CR>", opts)
keymap("n", "<C-/>", ":Telescope buffers<CR>", opts)

-- Git
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
