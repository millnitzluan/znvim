local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("", "<Space>", "<Nop>", opts)

-- Close buffer without closing window
map("n", ",d", ":b#<bar>bd#<CR>", opts)

-- Nvim tree
map("n", "<Leader>e", "<Cmd>NvimTreeToggle<CR>", { noremap = true })
map("n", "<leader>E", "<Cmd>NvimTreeFindFile<CR>", { noremap = true })

-- Telescope
map("n", "<Leader>fe", "<CMD>Telescope grep_string<CR>", opts)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fs", "<cmd>Telescope git_status<CR>", opts)
map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", opts)
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fk", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opts)

-- Hop
map("n", "f", "<cmd>HopWord <CR>", opts)
