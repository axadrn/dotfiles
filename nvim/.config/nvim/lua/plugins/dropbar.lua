return {
	"Bekaboo/dropbar.nvim",
	enabled = false,
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
