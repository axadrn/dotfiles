return {
  "windwp/nvim-autopairs",
  enabled = false,
  event = "InsertEnter",
  config = function()
    local autopairs = require("nvim-autopairs")
    autopairs.setup()
  end,
}
