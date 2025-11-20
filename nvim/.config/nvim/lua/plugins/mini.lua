return {
  "echasnovski/mini.nvim",
  config = function()
    -- mini.git
    require("mini.git").setup()

    -- mini.diff
    local diff = require("mini.diff")
    diff.setup()

    vim.keymap.set("n", "]g", function() diff.goto_hunk("next") end, { desc = "Next Hunk" })
    vim.keymap.set("n", "[g", function() diff.goto_hunk("prev") end, { desc = "Prev Hunk" })
    vim.keymap.set("n", "<Leader>gp", diff.toggle_overlay, { desc = "Preview Hunk" })
    vim.keymap.set("n", "<Leader>gs", function() vim.cmd("Git add %") end, { desc = "Stage Buffer" })
    vim.keymap.set("n", "<Leader>gr", function() diff.do_hunks(nil, "reset") end, { desc = "Reset Hunks" })

    -- mini.files
    local mini_files = require("mini.files")
    mini_files.setup({
      mappings = {
        synchronize = "<Leader>w",
      },
      options = {
        -- Linux/Mac: ~/.local/share/nvim/mini.files/trash/
        permanent_delete = false,
      },
    })

    vim.keymap.set("n", "<leader>m", function()
      require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
    end, { desc = "Open mini.files" })

    vim.keymap.set("n", "<leader>M", function()
      require("mini.files").open(vim.loop.cwd(), true)
    end, { desc = "Open mini.files (CWD)" })

    -- mini.statusline
    vim.o.laststatus = 3
    local statusline = require("mini.statusline")
    statusline.setup({
      content = {
        active = function()
          local mode, mode_hl = statusline.section_mode({})
          local git = vim.b.minigit_summary_string or ""
          local root = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          local file = vim.fn.expand("%:~:.")
          local filename = (file ~= "" and root .. " › " .. file:gsub("/", " › ")) or "[No Name]"
          local location = statusline.section_location({})
          return statusline.combine_groups({
            { hl = mode_hl,                  strings = { mode } },
            { hl = "MiniStatuslineDevinfo",  strings = { git } },
            { hl = "MiniStatuslineFilename", strings = { filename } },
            "%=",
            { hl = "MiniStatuslineFilename", strings = { location } },
          })
        end,
      },
      use_icons = true,
      set_vim_settings = false,
    })

    -- mini.notify
    require("mini.notify").setup()
    vim.notify = require("mini.notify").make_notify()

    -- mini.pairs
    require("mini.pairs").setup()

    -- mini.indentscope
    require("mini.indentscope").setup({})

    -- mini.bufremove
    local bufremove = require("mini.bufremove")
    bufremove.setup()

    vim.keymap.set("n", "<leader>c", function()
      bufremove.delete(0, false)
    end, { desc = "Close Buffer" })

    vim.keymap.set("n", "<leader>C", function()
      bufremove.delete(0, true)
    end, { desc = "Close Buffer (Force)" })
  end,
}
