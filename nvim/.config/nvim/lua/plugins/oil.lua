return {
	"stevearc/oil.nvim",
	enabled = false, -- Disable oil.nvim to use snacks explorer
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local oil = require("oil")
		oil.setup({
			view_options = {
				show_hidden = true,
			},
			-- Linux: `~/.local/share/Trash/`
			-- macOS: `~/.Trash/`
			-- Windows: Recycle Bin
			delete_to_trash = true,
		})
		vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Explorer (Oil)" })
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })
	end,
}
