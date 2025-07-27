return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    "telescope", -- Use telescope defaults for familiar UI
    defaults = {
      formatter = "path.filename_first", -- Filename first for ALL pickers
    },
    keymap = {
      builtin = {
        ["<C-j>"] = "down",
        ["<C-k>"] = "up",
      },
    },
    winopts = {
      width = 0.8,
      height = 0.8,
      preview = {
        layout = "vertical",
        vertical = "up:40%",
      },
    },
    files = {
      fd_opts = "--type f --hidden --exclude .git --exclude node_modules --exclude .venv",
    },
    grep = {
      rg_opts =
      "--hidden --glob '!.git' --glob '!node_modules' --glob '!.venv' --line-number --no-heading --color=always --smart-case",
    },
  },
  keys = {
    -- File pickers
    { "<leader>ff",       "<cmd>FzfLua files<cr>",                    desc = "Find Files" },
    { "<leader>fo",       "<cmd>FzfLua oldfiles<cr>",                 desc = "Find Oldfiles" },
    { "<leader><leader>", "<cmd>FzfLua buffers<cr>",                  desc = "Find Buffers" },

    -- Search pickers
    { "<leader>fw",       "<cmd>FzfLua grep_cword<cr>",               desc = "Find Word" },
    { "<leader>fg",       "<cmd>FzfLua live_grep<cr>",                desc = "Find Grep" },
    { "<leader>f/",       "<cmd>FzfLua grep_curbuf<cr>",              desc = "Find in Current Buffer" },

    -- LSP pickers
    { "<leader>fs",       "<cmd>FzfLua lsp_document_symbols<cr>",     desc = "Find Document Symbols" },
    { "<leader>fS",       "<cmd>FzfLua lsp_workspace_symbols<cr>",    desc = "Find Workspace Symbols" },
    { "<leader>fd",       "<cmd>FzfLua lsp_document_diagnostics<cr>", desc = "Find Diagnostics" },

    -- Other pickers
    { "<leader>fh",       "<cmd>FzfLua help_tags<cr>",                desc = "Find Help" },
    { "<leader>fk",       "<cmd>FzfLua keymaps<cr>",                  desc = "Find Keymaps" },
    { "<leader>fr",       "<cmd>FzfLua resume<cr>",                   desc = "Resume Last Search" },
  },
}
