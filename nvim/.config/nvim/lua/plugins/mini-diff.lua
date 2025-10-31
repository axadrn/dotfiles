return {
  "echasnovski/mini.diff",
  config = function()
    local diff = require("mini.diff")
    diff.setup()

    -- Keymaps
    vim.keymap.set("n", "]g", function() diff.goto_hunk("next") end, { desc = "Next Hunk" })
    vim.keymap.set("n", "[g", function() diff.goto_hunk("prev") end, { desc = "Prev Hunk" })
    vim.keymap.set("n", "<Leader>gp", diff.toggle_overlay, { desc = "Preview Hunk" })
    vim.keymap.set("n", "<Leader>gs", function() vim.cmd("Git add %") end, { desc = "Stage Buffer" })
    vim.keymap.set("n", "<Leader>gr", function() diff.do_hunks(nil, "reset") end, { desc = "Reset Hunks" })
  end,
}
