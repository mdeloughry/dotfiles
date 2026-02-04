-- LSP Configuration
return {
  -- Mason: LSP installer
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- LSP Configuration (combines mason-lspconfig setup)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Diagnostic config
      vim.diagnostic.config({
        virtual_text = { prefix = "●" },
        float = { border = "rounded" },
        signs = true,
        underline = true,
        update_in_insert = false,
      })

      -- Diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl })
      end

      -- LSP keymaps on attach
      local on_attach = function(_, bufnr)
        local opts = { buffer = bufnr, silent = true }
        local keymap = vim.keymap.set

        keymap("n", "gd", vim.lsp.buf.definition, opts)
        keymap("n", "gD", vim.lsp.buf.declaration, opts)
        keymap("n", "gi", vim.lsp.buf.implementation, opts)
        keymap("n", "gr", vim.lsp.buf.references, opts)
        keymap("n", "K", vim.lsp.buf.hover, opts)
        keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        keymap("n", "<leader>cr", vim.lsp.buf.rename, opts)
        keymap("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, opts)
        keymap("n", "[d", vim.diagnostic.goto_prev, opts)
        keymap("n", "]d", vim.diagnostic.goto_next, opts)
        keymap("n", "<leader>ld", vim.diagnostic.open_float, opts)
      end

      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Server-specific settings
      local server_settings = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        },
        ts_ls = {
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
        intelephense = {
          filetypes = { "php", "blade" },
        },
        tailwindcss = {
          filetypes = {
            "html", "css", "scss", "javascript", "javascriptreact",
            "typescript", "typescriptreact", "vue", "svelte", "astro",
            "blade", "php",
          },
        },
        gopls = {
          settings = {
            gopls = {
              gofumpt = true,
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
            },
          },
        },
      }

      -- Setup mason-lspconfig with handlers
      mason_lspconfig.setup({
        ensure_installed = {
          "intelephense",    -- PHP/Laravel
          "ts_ls",           -- TypeScript
          "tailwindcss",     -- Tailwind
          "gopls",           -- Go
          "lua_ls",          -- Lua
          "html",            -- HTML
          "cssls",           -- CSS
          "jsonls",          -- JSON
          "yamlls",          -- YAML
          "bashls",          -- Bash
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server_opts = server_settings[server_name] or {}
            server_opts.on_attach = on_attach
            server_opts.capabilities = capabilities
            lspconfig[server_name].setup(server_opts)
          end,
        },
      })
    end,
  },

  -- Conform for formatting (simpler than none-ls)
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      { "<leader>cf", function() require("conform").format({ async = true }) end, desc = "Format" },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt", "goimports" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        php = { "pint" },
      },
      format_on_save = function(bufnr)
        -- Disable for certain filetypes
        local ignore_filetypes = { "sql", "java" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
    },
  },
}
