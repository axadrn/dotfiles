-- Register templ filetype
vim.filetype.add({ extension = { templ = "templ" } })

return {
  "williamboman/mason.nvim",
  enabled = true,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    -- Get capabilities from blink.cmp
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- Configure diagnostics
    local icons = require("config.icons").icons
    vim.diagnostic.config({
      virtual_text = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = icons.misc.Flame,
          [vim.diagnostic.severity.WARN] = icons.misc.Flame,
          [vim.diagnostic.severity.INFO] = icons.misc.Flame,
          [vim.diagnostic.severity.HINT] = icons.misc.Flame,
        },
      },
      float = {
        border = "rounded",
        source = true,
      },
    })

    -- Custom diagnostic keymap (gl instead of default <C-W>d)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Hover Diagnostics" })
    -- [d and ]d are already default keymaps in Neovim 0.10+

    -- Global config for all LSP servers
    vim.lsp.config('*', {
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        local opts = { buffer = bufnr }
        local function map(key, func, desc)
          opts.desc = desc
          vim.keymap.set("n", key, func, opts)
        end

        -- Only mappings that are NOT default in Neovim 0.11
        map("gd", vim.lsp.buf.definition, "Go to Definition")
        map("gs", vim.lsp.buf.signature_help, "Signature Help")
        
        -- LSP management (no defaults for these)
        map("<leader>li", "<cmd>LspInfo<cr>", "LSP Info")
        map("<leader>ls", "<cmd>LspRestart<cr>", "LSP Restart")
      end,
    })

    -- Mason setup
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- Install language servers via Mason
    mason_lspconfig.setup({
      ensure_installed = {
        "tsserver",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "lua_ls",
        "emmet_ls",
        "gopls",
        "templ",
        "htmx",
        "astro",
        "bashls",
        "docker_compose_language_service",
        "dockerls",
      },
      automatic_installation = true,
    })

    -- Configure formatters/linters
    mason_tool_installer.setup({
      ensure_installed = {
        "prettierd",
        "stylua",
        "eslint_d",
        "goimports",
      },
    })

    -- Enable all configured LSP servers
    vim.lsp.enable({
      "gopls",
      "ts_ls",
      "html",
      "cssls",
      "tailwindcss",
      "svelte",
      "lua_ls",
      "emmet_ls",
      "templ",
      "htmx",
      "bashls",
    })
  end,
}