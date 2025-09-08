return {
  "saghen/blink.cmp",
  lazy = false,
  version = "v0.*",
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
