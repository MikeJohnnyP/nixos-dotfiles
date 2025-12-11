return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"saghen/blink.cmp",
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
			-- local telescope = require("telescope")
			-- telescope.setup({
			-- 	pickers = {
			-- 		find_files = {
			-- 			theme = "ivy",
			-- 		},
			-- 		grep_string = {
			-- 			theme = "ivy",
			-- 		},
			-- 		live_grep = {
			-- 			theme = "ivy",
			-- 		},
			-- 		diagnostics = {
			-- 			theme = "dropdown",
			-- 		},
			-- 		buffers = {
			-- 			theme = "dropdown",
			-- 		},
			-- 		help_tags = {
			-- 			theme = "dropdown",
			-- 		},
			-- 	},
			-- 	extensions = {},
			-- })
		end,
	},
	{
		{
			"nvim-telescope/telescope-ui-select.nvim",
			config = function()
				-- get access to telescopes navigation functions
				local actions = require("telescope.actions")

				require("telescope").setup({
					-- use ui-select dropdown as our ui
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({}),
						},
					},
					-- set keymappings to navigate through items in the telescope io
					mappings = {
						-- i = {
						-- use <cltr> + n to go to the next option
						-- ["<C-n>"] = actions.cycle_history_next,
						-- -- use <cltr> + p to go to the previous option
						-- ["<C-p>"] = actions.cycle_history_prev,
						-- -- use <cltr> + j to go to the next preview
						-- ["<C-j>"] = actions.move_selection_next,
						-- -- use <cltr> + k to go to the previous preview
						-- ["<C-k>"] = actions.move_selection_previous,
						-- },
					},
					-- load the ui-select extension
					require("telescope").load_extension("ui-select"),
					require("telescope").load_extension("projects"),
				})

				vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
				vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
				vim.keymap.set(
					"n",
					"<leader>fw",
					require("telescope.builtin").grep_string,
					{ desc = "[S]earch current [W]ord" }
				)
				vim.keymap.set(
					"n",
					"<leader>fg",
					require("telescope.builtin").live_grep,
					{ desc = "[S]earch by [G]rep" }
				)
				vim.keymap.set(
					"n",
					"<leader>fd",
					require("telescope.builtin").diagnostics,
					{ desc = "[S]earch [D]iagnostics" }
				)
				vim.keymap.set(
					"n",
					"<leader>fb",
					require("telescope.builtin").buffers,
					{ desc = "[ ] Find existing buffers" }
				)
				vim.keymap.set("n", "<space>en", function()
					require("telescope.builtin").find_files({
						cwd = vim.fn.stdpath("config"),
					})
				end)

				vim.keymap.set("n", "<leader>;;", function()
					require("telescope").extensions.projects.projects({})
				end, { desc = "Find Project" })
			end,
		},
	},
}
