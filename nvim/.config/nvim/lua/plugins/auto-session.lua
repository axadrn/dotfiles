return {
  "rmagatti/auto-session",
  config = function()
    local auto_session = require("auto-session")

    auto_session.setup({
      auto_restore_enabled = true,
      log_level = "error",
      pre_save_cmds = { "Neotree close" },
    })
  end,
}
