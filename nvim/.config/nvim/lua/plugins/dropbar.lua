return {
  "Bekaboo/dropbar.nvim",
  config = function()
    require("dropbar").setup({
      bar = {
        sources = function(buf, _)
          return { require("dropbar.sources").path }
        end,
      },
    })
  end,
}
