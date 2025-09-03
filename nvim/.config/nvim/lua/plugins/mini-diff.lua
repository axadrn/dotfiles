return {
  "echasnovski/mini.diff",
  event = "BufReadPre",
  config = function()
    local diff = require("mini.diff")

    diff.setup({
      -- View style
      view = {
        style = "sign",
        -- signs = { add = "+", change = "~", delete = "-" },
      },
    })

    -- Keymaps matching your existing gitsigns setup
    local keymap = vim.keymap

    -- Navigation
    keymap.set("n", "]g", function()
      diff.goto_hunk("next")
    end, { desc = "Next Hunk" })

    keymap.set("n", "[g", function()
      diff.goto_hunk("prev")
    end, { desc = "Previous Hunk" })

    -- Preview
    keymap.set("n", "<Leader>gp", function()
      diff.toggle_overlay(vim.api.nvim_get_current_buf())
    end, { desc = "Preview Hunk" })

    -- Reset operations
    keymap.set("n", "<Leader>gr", function()
      return diff.operator("reset") .. "gh"
    end, { desc = "Reset Hunk", expr = true, remap = true })

    keymap.set("x", "<Leader>gr", function()
      diff.do_hunks(0, "reset", {
        line_start = vim.fn.line("'<"),
        line_end = vim.fn.line("'>"),
      })
    end, { desc = "Reset Hunk" })

    keymap.set("n", "<Leader>gR", function()
      local line_count = vim.api.nvim_buf_line_count(0)
      diff.do_hunks(0, "reset", { line_start = 1, line_end = line_count })
    end, { desc = "Reset Buffer" })

    -- Stage operations (apply in mini.diff)
    keymap.set("n", "<Leader>gs", function()
      return diff.operator("apply") .. "gh"
    end, { desc = "Stage Hunk", expr = true, remap = true })

    keymap.set("x", "<Leader>gs", function()
      diff.do_hunks(0, "apply", {
        line_start = vim.fn.line("'<"),
        line_end = vim.fn.line("'>"),
      })
    end, { desc = "Stage Hunk" })

    keymap.set("n", "<Leader>gS", function()
      local line_count = vim.api.nvim_buf_line_count(0)
      diff.do_hunks(0, "apply", { line_start = 1, line_end = line_count })
    end, { desc = "Stage Buffer" })

    -- Note: Unstaging is not supported in mini.diff
    -- You can use git commands or another tool for unstaging
  end,
}
