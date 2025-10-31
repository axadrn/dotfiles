return {
  "echasnovski/mini.statusline",
  config = function()
    vim.o.laststatus = 3
    local statusline = require("mini.statusline")
    statusline.setup({
      content = {
        active = function()
          local mode, mode_hl = statusline.section_mode({})
          local filename = vim.fn.expand("%:t") ~= "" and vim.fn.expand("%:t") or "[No Name]"
          local location = statusline.section_location({})
          return statusline.combine_groups({
            { hl = mode_hl,                  strings = { mode } },
            { hl = "MiniStatuslineFilename", strings = { filename } },
            "%=",
            { hl = mode_hl, strings = { location } },
          })
        end,
      },
      use_icons = false,
      set_vim_settings = false,
    })
  end,
}
