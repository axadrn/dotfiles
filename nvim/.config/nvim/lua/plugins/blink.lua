return {
  "saghen/blink.cmp",
  lazy = false,
  version = "v0.*",
  keys = {
    {
      "<leader>tc",
      function()
        local config = require("blink.cmp.config")
        local menu = require("blink.cmp.completion.windows.menu")
        local current_state = config.completion.menu.auto_show

        if current_state == true then
          config.completion.menu.auto_show = false
          menu.auto_show = false
          menu.close()
          vim.notify("Completion auto-show disabled (Ctrl+Space to trigger)", vim.log.levels.WARN)
        else
          config.completion.menu.auto_show = true
          menu.auto_show = true
          vim.notify("Completion auto-show enabled", vim.log.levels.INFO)
        end
      end,
      desc = "Toggle Completion Auto-show",
    },
  },
  opts = {
    keymap = {
      preset = "default",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "accept", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      menu = {
        auto_show = false,
      },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
  },
}
