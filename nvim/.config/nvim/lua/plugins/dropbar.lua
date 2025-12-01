return {
	"Bekaboo/dropbar.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>tb",
			function()
				vim.g.dropbar_off = not vim.g.dropbar_off
				if vim.g.dropbar_off then
					vim.wo.winbar = ""
				else
					require("dropbar.utils").bar.attach(vim.api.nvim_get_current_buf(), vim.api.nvim_get_current_win())
				end
			end,
			desc = "Toggle Dropbar",
		},
	},
	opts = {
		bar = {
			enable = function(buf, win)
				return not vim.g.dropbar_off and vim.bo[buf].buftype == ""
			end,
			sources = function()
				return { require("dropbar.sources").path }
			end,
		},
	},
}
