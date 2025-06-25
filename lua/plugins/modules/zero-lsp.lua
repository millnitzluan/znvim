return {
  {
    "saghen/blink.cmp",
    dependencies = {
      { "xzbdmw/colorful-menu.nvim", opts = {} },
    },
    enabled = true,
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = "none" },

      appearance = {
        nerd_font_variant = "mono",
        kind_icons = {
          Constant = "",
          Field = "",
          Property = "",
          Interface = "",
          Keyword = "",
          Type = "",
          TypeParameter = "",
          Variable = "",
          Class = "",
          Function = "",
          Method = "",
        },
      },

      completion = {
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
          },
        },
        menu = {
          border = "none",
          draw = {
            columns = {
              { "kind_icon" },
              { "label", gap = 1 },
              { "kind" },
            },
            components = {
              label = {
                text = function(ctx)
                  return require("colorful-menu").blink_components_text(ctx)
                end,
                highlight = function(ctx)
                  return require("colorful-menu").blink_components_highlight(ctx)
                end,
              },
            },
          },
        },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      snippets = { preset = "luasnip" },

      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
  -- {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter",
  --   dependencies = {
  --     { "L3MON4D3/LuaSnip" },
  --   },
  --   config = function()
  --     local cmp = require("cmp")
  --
  --     cmp.setup({
  --       sources = {
  --         { name = "nvim_lsp" },
  --       },
  --       mapping = cmp.mapping.preset.insert({
  --         ["<C-p>"] = cmp.mapping.select_prev_item(),
  --         ["<C-n>"] = cmp.mapping.select_next_item(),
  --         ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  --         ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --         ["<C-Space>"] = cmp.mapping.complete(),
  --         ["<C-e>"] = cmp.mapping.close(),
  --         ["<CR>"] = cmp.mapping.confirm({
  --           behavior = cmp.ConfirmBehavior.Replace,
  --           select = true,
  --         }),
  --         ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
  --         ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
  --       }),
  --       snippet = {
  --         expand = function(args)
  --           vim.snippet.expand(args.body)
  --         end,
  --       },
  --     })
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    version = false,
    event = "BufReadPre",
    dependencies = {
      { "williamboman/mason.nvim", config = true, cmd = "Mason" },
      "nvim-telescope/telescope.nvim",
      "b0o/SchemaStore.nvim",
      "stevearc/conform.nvim",
    },
    config = function()
      -- Lista de pacotes a serem instalados pelo Mason
      local packages = {
        "bash-language-server",
        "dockerfile-language-server",
        "gopls",
        "json-lsp",
        "lua-language-server",
        "pyright",
        "ruff",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "stylua",
        "terraform-ls",
        "typescript-language-server",
        "yaml-language-server",
        "yamllint",
        "zls",
      }

      local registry = require("mason-registry")
      for _, pkg in pairs(packages) do
        if not registry.is_installed(pkg) then
          registry.get_package(pkg):install()
        end
      end

      -- Diagnósticos
      vim.diagnostic.config({
        virtual_text = false,
        severity_sort = true,
        virtual_lines = false,
      })

      -- Capabilities (ex: para integração com autocompletion)
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Configuração dos LSPs
      local lspconfig = require("lspconfig")
      local servers = {
        bashls = {},
        dockerls = {},
        gopls = {},
        jsonls = {},
        lua_ls = {},
        pyright = {},
        ruff = {},
        terraformls = {},
        -- tsserver = {}, -- usado para .ts/.tsx
        ts_ls = {},
        yamlls = {},
        zls = {},
      }

      for server, opts in pairs(servers) do
        opts.capabilities = capabilities
        lspconfig[server].setup(opts)
      end

      -- Autocmd para setup adicional quando o LSP conectar
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

          if client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
          end

          -- Inlay hints
          -- if client.server_capabilities.inlayHintProvider then
          --   vim.keymap.set("n", "<leader>th", function()
          --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          --   end, { buffer = args.buf })
          -- end

          -- Keymaps
          local tb = require("telescope.builtin")
          local opts = { silent = true, noremap = true, buffer = 0 }
          local mappings = {
            { "n", "<leader>li", vim.cmd.LspInfo, opts },
            { "n", "<leader>ls", vim.cmd.LspStop, opts },
            { "n", "<leader>lr", vim.cmd.LspRestart, opts },
            { "n", "gD", vim.lsp.buf.declaration, opts },
            { "n", "gd", vim.lsp.buf.definition, opts },
            { "n", "gT", vim.lsp.buf.type_definition, opts },
            { "n", "gr", vim.lsp.buf.rename, opts },
            { "n", "<leader>ca", vim.lsp.buf.code_action, opts },
            { "n", "<leader>gR", tb.lsp_references, opts },
            { "i", "<C-x>", vim.lsp.buf.signature_help, opts },
          }

          for _, map in pairs(mappings) do
            vim.keymap.set(unpack(map))
          end
        end,
      })

      -- Formatter setup
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "ruff" },
        },
      })

      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function(args)
          require("conform").format({
            bufnr = args.buf,
            lsp_fallback = true,
            quiet = true,
          })
        end,
      })
    end,
  },
}
