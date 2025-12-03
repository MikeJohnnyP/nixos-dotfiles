return {
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			enabled = true,
			show_start = true,
			show_end = false,
			injected_languages = false,
			highlight = { "Function", "Label" },
			priority = 500,
		},
		config = function()
			require('ibl').setup()
		end,
	},
}
