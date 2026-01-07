-- lua/custom/plugins/mini.lua
return {
	{
		"echasnovski/mini.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		version = false,
		enabled = true,
		config = function()
			local ts_context_commentstring = require("ts_context_commentstring")

			ts_context_commentstring.setup({
				enable_autocmd = false,
			})

			local surround = require("mini.surround")
			local hipatterns = require("mini.hipatterns")
			local move = require("mini.move")
			local files = require("mini.files")
			local misc = require("mini.misc")
			local comment = require("mini.comment")
			local miniTrailspace = require("mini.trailspace")
			local miniSplitJoin = require("mini.splitjoin")

			hipatterns.setup()
			surround.setup()
			move.setup()
			files.setup()
			misc.setup()
			comment.setup({
				options = {
					custom_commentstring = function()
						return require("ts_context_commentstring.internal").calculate_commentstring({
							key = "commentstring",
						}) or vim.bo.commentstring
					end,
				},
				mappings = {
					comment = "<leader>c",
					comment_line = "<leader>c",
					comment_visual = "<leader>c",
					textobject = "<leader>c",
				},
			})

			miniTrailspace.setup({
				only_in_normal_buffers = true,
			})

			miniSplitJoin.setup({
				mappings = { toggle = "" }, -- Disable default mapping
			})

			vim.keymap.set("n", "<leader>tw", function()
				miniTrailspace.trim()
			end, { desc = "Erase Whitespace" })

			-- File explorer mappings
			vim.keymap.set("n", "\\\\", function()
				files.open()
			end, { desc = "Toggle mini file explorer" }) -- toggle file explorer
			vim.keymap.set("n", "\\", function()
				files.open(vim.api.nvim_buf_get_name(0), false)
				files.reveal_cwd()
			end, { desc = "Toggle into currently opened file" })

			-- Zoom mapping
			vim.keymap.set("n", "<leader>az", function()
				require("mini.misc").zoom()
			end, { desc = "Zoom window" })

			-- Split and Join mappings
			vim.keymap.set({ "n", "x" }, "<leader>sj", function()
				miniSplitJoin.join()
			end, { desc = "Join arguments" })
			vim.keymap.set({ "n", "x" }, "<leader>sk", function()
				miniSplitJoin.split()
			end, { desc = "Split arguments" })

			-- Ensure highlight never reappears by removing it on CursorMoved
			vim.api.nvim_create_autocmd("CursorMoved", {
				pattern = "*",
				callback = function()
					require("mini.trailspace").unhighlight()
				end,
			})
		end,
	},
}
