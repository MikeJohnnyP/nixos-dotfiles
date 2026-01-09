return {
	{
		"folke/noice.nvim",
		config = function()
			require("noice").setup({
				presets = {
					command_palette = true,
				},
				lsp = {
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = false,
						["vim.lsp.util.stylize_markdown"] = false,
						["cmp.entry.get_documentation"] = false, -- if using nvim-cmp
					},
					hover = { enabled = false },
					signature = { enabled = false },
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
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
		},
	},
}
