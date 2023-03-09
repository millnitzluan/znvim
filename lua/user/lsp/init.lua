local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
