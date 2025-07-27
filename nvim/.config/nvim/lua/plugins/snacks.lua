return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    explorer = {
      -- Enable explorer as a sidebar
      enabled = true,
    },
    picker = {
      enabled = true,
      -- Navigation keymaps
      keys = {
        ["<C-j>"] = "nav_down",
        ["<C-k>"] = "nav_up",
      },
      sources = {
        files = {
          hidden = true,
          ignored = false,
          exclude = { ".git/", "node_modules/", ".venv/" },
        },
        explorer = {
          -- Explorer picker configuration
        },
      },
      formatters = {
        file = {
          filename_first = true, -- Show filename first like telescope
        },
      },
    },
  },
  keys = {
    -- Explorer
    { "<leader>e",        function() require("snacks").explorer() end,                          desc = "Open Explorer" },

    -- File pickers
    { "<leader>ff",       function() require("snacks").picker.files() end,                      desc = "Find Files" },
    { "<leader>fo",       function() require("snacks").picker.recent() end,                     desc = "Find Oldfiles" },
    { "<leader><leader>", function() require("snacks").picker.buffers({ current = false }) end, desc = "Find Buffers" },

    -- Search pickers
    { "<leader>fw",       function() require("snacks").picker.grep_word() end,                  desc = "Find Word" },
    { "<leader>fg",       function() require("snacks").picker.grep() end,                       desc = "Find Grep" },
    { "<leader>f/",       function() require("snacks").picker.lines() end,                      desc = "Find in Current Buffer" },

    -- Other pickers
    { "<leader>fh",       function() require("snacks").picker.help() end,                       desc = "Find Help" },
    { "<leader>fk",       function() require("snacks").picker.keymaps() end,                    desc = "Find Keymaps" },
    { "<leader>fr",       function() require("snacks").picker.resume() end,                     desc = "Resume Last Search" },
  },
}
