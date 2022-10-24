local servers = require("nvim-lsp-installer.servers")
local null_ls = require("null-ls")
local util = require("vim.lsp.util")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function on_attach(client, bufnr)
  local opts = { silent = true, noremap = true }

  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", [[<Cmd>lua vim.lsp.buf.hover()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", [[<Cmd>lua vim.lsp.buf.declaration()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", [[<Cmd>lua vim.lsp.buf.definition()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", [[<Cmd>lua vim.lsp.buf.rename()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>gR", "<cmd>TroubleToggle lsp_references<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "i", "<C-x>", [[<Cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[e", [[<Cmd>lua vim.diagnostic.goto_next()<CR>]], opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]e", [[<Cmd>lua vim.diagnostic.goto_prev()<CR>]], opts)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.formatting_seq_sync()
      end,
    })
  end

  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.cmd([[
      augroup lsp_document_highlight
      autocmd! * <buffer>
      autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]])
  end
end

local function make_config()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  return {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- lsp servers
local required_servers = {
  "sumneko_lua", -- lua
  "tsserver", -- js, jsx, tsx
  "yamlls", -- yaml
  "vimls", -- vim
  "jsonls", -- json
  "sqlls", -- sql
  "solargraph", -- ruby
  "rust_analyzer",
}

-- default config
local cfg = make_config()

-- configuring null-ls for formatters
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  sources = {
    formatting.stylua,
    formatting.prettierd,
    formatting.rubocop,
    formatting.rustfmt,
    diagnostics.eslint_d,
    diagnostics.rubocop.with({
      method = null_ls.methods.DIAGNOSTICS_ON_SAVE,
    }),
  },
  on_attach = cfg.on_attach,
})

-- setup diagnostics
vim.diagnostic.config({ virtual_text = false })
vim.api.nvim_create_autocmd({ "CursorHold" }, {
  callback = function()
    if vim.lsp.buf.server_ready() then
      vim.diagnostic.open_float()
    end
  end,
})

-- set up LSP signs
for type, icon in pairs({
  Error = "",
  Warn = "",
  Hint = "",
  Info = "",
}) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- lua special setup
local luadev = require("neodev").setup({
  lspconfig = {
    cmd = {
      vim.fn.expand(
        "~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin/lua-language-server",
        false,
        false
      ),
    },
    Lua = {
      format = false,
    },
    on_attach = cfg.on_attach,
    capabilities = cfg.capabilities,
  },
})

-- check for missing lsp servers and install them
for _, svr in pairs(required_servers) do
  local ok, lsp_server = servers.get_server(svr)
  if ok then
    lsp_server:on_ready(function()
      if svr == "sumneko_lua" then
        lsp_server:setup(luadev)
      else
        lsp_server:setup(cfg)
      end
    end)

    if not lsp_server:is_installed() then
      lsp_server:install()
    end
  end
end

return { config = make_config }
