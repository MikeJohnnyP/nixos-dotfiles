return {
	{
		'saghen/blink.cmp',
		enabled = true,
		dependencies = {
			'rafamadriz/friendly-snippets',
			"xzbdmw/colorful-menu.nvim",
		},
		version = 'v0.*',
		opts = {
			keymap = {
				preset = 'default',
				['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-e>'] = { 'hide', 'fallback' },
				['<CR>'] = { 'accept', 'fallback' },

				['<Tab>'] = { 'snippet_forward', 'fallback' },
				['<S-Tab>'] = { 'snippet_backward', 'fallback' },

				['<Up>'] = { 'select_prev', 'fallback' },
				['<Down>'] = { 'select_next', 'fallback' },
				['<C-p>'] = { 'select_prev', 'fallback' },
				['<C-n>'] = { 'select_next', 'fallback' },

				['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
				['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

				-- 'prefix' will fuzzy match on the text before the cursor
				-- 'full' will fuzzy match on the text before *and* after the cursor
				-- example: 'foo_|_bar' will match 'foo_' for 'prefix' and 'foo__bar' for 'full'
				keyword = { range = 'full' },

			},

			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = 'mono'
			},

			signature = {
				enabled = true,
				window = {
					border = "rounded",
					winblend = 0,
				},
			},
			completion = {
				documentation = {
					auto_show = false,
					auto_show_delay_ms = 500,
					window = {
						border = "rounded",
						winblend = 0,
					},
				},
				menu = {
					draw = {
						treesitter = { "lsp" },
						columns = { { "kind_icon" }, { "label", gap = 1 }, { "label_description", gap = 1 } },
						components = {
							label = {
								width = { fill = true, max = 60 },
								text = function(ctx)
									local highlights_info = require("colorful-menu").blink_highlights(ctx)
									if highlights_info ~= nil then
										-- Or you want to add more item to label
										return highlights_info.label
									else
										return ctx.label
									end
								end,
								highlight = function(ctx)
									local highlights = {}
									local highlights_info = require("colorful-menu").blink_highlights(ctx)
									if highlights_info ~= nil then
										highlights = highlights_info.highlights
									end
									for _, idx in ipairs(ctx.label_matched_indices) do
										table.insert(highlights, { idx, idx + 1, group = "BlinkCmpLabelMatch" })
									end
									-- Do something else
									return highlights
								end,
							},
						},
					},

					border = "rounded",
					winblend = 0,
				},
			}
		},

	}
}
