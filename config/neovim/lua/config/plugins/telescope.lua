return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'saghen/blink.cmp',
			{
				"folke/lazydev.nvim",
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			require('telescope').setup {
				pickers = {
					find_files = {
						theme = "ivy"
					},
					grep_string = {
						theme = "ivy"
					},
					live_grep = {
						theme = "ivy"
					},
					diagnostics = {
						theme = "dropdown"
					},
					buffers = {
						theme = "dropdown"
					},
					help_tags = {
						theme = "dropdown"
					}


				},
				extensions = {
				}
			}

			vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
			vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
			vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string,
				{ desc = '[S]earch current [W]ord' })
			vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep,
				{ desc = '[S]earch by [G]rep' })
			vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics,
				{ desc = '[S]earch [D]iagnostics' })
			vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers,
				{ desc = '[ ] Find existing buffers' })
			vim.keymap.set("n", "<space>en", function()
				require('telescope.builtin').find_files {
					cwd = vim.fn.stdpath("config")
				}
			end)
		end
	}
}
