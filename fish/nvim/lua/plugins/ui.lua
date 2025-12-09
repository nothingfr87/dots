return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			contrast = "hard",
		},
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"xiyaowong/transparent.nvim",
		lazy = false,
		config = function()
			require("transparent").setup()
		end,
	},
	{
		"arcticicestudio/nord-vim",
		name = "nord",
		lazy = false,
		config = function() end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{ "nvim-tree/nvim-web-devicons" },
	{
		"nvim-lualine/lualine.nvim",
		opts = {},
	},
	{
		"norcalli/nvim-colorizer.lua",
		lazy = false,
		priority = 1000,
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			filters = {
				dotfiles = true,
			},
			view = {
				width = 30,
				side = "left",
				number = false,
			},
		},
	},
}
