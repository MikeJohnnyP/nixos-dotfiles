-- lua/custom/plugins/mini.lua
return {
	{
		"echasnovski/mini.nvim",
		enabled = true,
		config = function()
			local surround = require("mini.surround")
			local bufremove = require("mini.bufremove")
			local icons = require("mini.icons")
			local hipatterns = require("mini.hipatterns")
			local move = require("mini.move")
			local files = require("mini.files")
			local misc = require("mini.misc")

			icons.setup()
			hipatterns.setup()
			bufremove.setup()
			surround.setup()
			move.setup()
			files.setup()
			misc.setup()

			vim.keymap.set("n", "\\", function()
				require("mini.files").open()
			end, { desc = "Open mini files" })

			vim.keymap.set("n", "<leader>az", function()
				require("mini.misc").zoom()
			end, { desc = "Zoom window" })
		end,
	},
}
