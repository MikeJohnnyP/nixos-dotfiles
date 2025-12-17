return {
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				presets = {
					command_palette = true,
				},
				-- add any options here
				routes = {
					{
						filter = {
							event = "lsp",
							kind = "progress",
							cond = function(message)
								local client = vim.tbl_get(message.opts, "progress", "client")
								if client ~= "jdtls" then
									return false
								end

								local content = vim.tbl_get(message.opts, "progress", "message")
								if content == nil then
									return false
								end

								return string.find(content, "Validate") or string.find(content, "Publish")
							end,
						},
						opts = { skip = true },
					},
				},
			})
			require("notify").setup({
				timeout = 3000,
				background_colour = "#000000",
				render = "compact",
				stages = "fade",
			})
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
	},
}
