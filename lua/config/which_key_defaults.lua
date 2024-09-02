return {
  mode = { "n", "v" },
    { "<leader>b", group = "Buffers" },
    { "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>", desc = "Sort by directory" },
    { "<leader>bL", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by language" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { "<leader>bW", "<cmd>noautocmd w<cr>", desc = "Save without formatting (noautocmd)" },
    { "<leader>bb", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous" },
    { "<leader>be", "<cmd>BufferLinePickClose<cr>", desc = "Pick which buffer to close" },
    { "<leader>bf", "<cmd>Telescope buffers previewer=false<cr>", desc = "Find" },
    { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close all to the left" },
    { "<leader>bj", "<cmd>BufferLinePick<cr>", desc = "Jump" },
    { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close all to the right" },
    { "<leader>bn", "<cmd>BufferLineCycleNext<cr>", desc = "Next" },
    { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>c", ":bd<CR>", desc = "Close Buffer" },
    { "<leader>f", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>g", group = "Git" },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = "Checkout commit(for current file)" },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit" },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Git Diff" },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame" },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file" },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk" },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk" },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk" },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk" },
    { "<leader>h", ":nohlsearch<CR>", desc = "No Highlight" },
    { "<leader>k", "<cmd>Telescope buffers previewer=false<cr>", desc = "Buffers" },
    { "<leader>l", group = "LSP" },
    { "<leader>lA", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", desc = "Range Code Actions" },
    { "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Declaration" },
    { "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
    { "<leader>lL", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    { "<leader>lR", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
    { "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implementation" },
    { "<leader>ll", "<cmd>Trouble diagnostics<cr>", desc = "Document Diagnostics (Trouble)" },
    { "<leader>lo", "<cmd>lua vim.lsp.buf.type_definition()<cr>", desc = "Type Definition" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename all references" },
    { "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", desc = "Display Signature Information" },
    { "<leader>lt", " <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", desc = "Refactor" },
    { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
    { "<leader>p", "<cmd>Telescope treesitter<CR>", desc = "List Symbols" },
    { "<leader>q", ":confirm q<CR>", desc = "Quit" },
    { "<leader>r", group = "Replace" },
    { "<leader>rf", "<cmd>lua require('spectre').open_file_search()<cr>", desc = "Replace Buffer" },
    { "<leader>rr", "<cmd>lua require('spectre').open()<cr>", desc = "Replace" },
    { "<leader>rw", "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = "Replace Word" },
    { "<leader>s", group = "Search" },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
    { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Find highlight groups" },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
    { "<leader>sS", "<cmd>Telescope git_stash<cr>", desc = "Git stash" },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
    { "<leader>sc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Find File" },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
    { "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File" },
    { "<leader>ss", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text" },
    { "<leader>sz", "<cmd>Telescope zoxide list<cr>", desc = "Zoxide" },
    { "<leader>t", group = "Todo" },
    { "<leader>tT", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    { "<leader>tX", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr><cr>", desc = "Todo/Fix/Fixme (Trouble)" },
    { "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    { "<leader>tx", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
    { "<leader>w", ":w!<CR>", desc = "Save" },
}
