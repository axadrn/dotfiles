return {
	{ "rebelot/kanagawa.nvim" },
	{ "nyoom-engineering/oxocarbon.nvim" },
	{ "catppuccin/nvim" },
	{ "projekt0n/github-nvim-theme" },
	{ "olimorris/onedarkpro.nvim" },
	{ "sainnhe/sonokai" },
	{ "ellisonleao/gruvbox.nvim" },
	{ "savq/melange-nvim" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"ribru17/bamboo.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("bamboo").setup({
				style = "vulgaris",
			})
			require("bamboo").load()
		end,
	},
	{ "EdenEast/nightfox.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "Mofiqul/dracula.nvim" },
	{ "sainnhe/sonokai" },
	{ "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({})
			vim.cmd.colorscheme("nord")
		end,
	},
	{
		"craftzdog/solarized-osaka.nvim",
		lazy = true,
		priority = 1000,
		opts = {
			transparent = true, -- Aktiviert die Transparenz für das Thema
			styles = {
				sidebars = "transparent", -- optional: setzt den Stil der Seitenleisten auf transparent
				floats = "transparent", -- optional: setzt den Stil der schwebenden Fenster auf transparent
			},
		},
	},
	{
		"rebelot/kanagawa.nvim",
		-- config = function()
		--   vim.cmd("colorscheme kanagawa-dragon")
		-- end
	},
}
