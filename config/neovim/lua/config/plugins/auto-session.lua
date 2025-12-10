return {
	{
		"rmagatti/auto-session",
		lazy = false,
		enabled = true,
		keys = {
			-- Will use Telescope if installed or a vim.ui.select picker otherwise
			{ "<leader>''", "<cmd>AutoSession search<CR>", desc = "Session search" },
			-- { "<leader>ws", "<cmd>AutoSession save<CR>", desc = "Save session" },
			-- { "<leader>wa", "<cmd>AutoSession toggle<CR>", desc = "Toggle autosave" },
		},

		---enables autocomplete for opts
		---@module "auto-session"
		---@type AutoSession.Config
		opts = {
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			log_level = "error",
		},
	},
}
