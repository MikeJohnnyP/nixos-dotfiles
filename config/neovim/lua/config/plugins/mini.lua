-- lua/custom/plugins/mini.lua
return {
	{
		'echasnovski/mini.nvim',
		enabled = true,
		config = function()
			-- local statusline = require 'mini.statusline'
			-- statusline.setup { use_icons = vim.g.have_nerd_font }

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			-- ---@diagnostic disable-next-line: duplicate-set-field
			-- statusline.section_location = function()
			-- 	return '%2l:%-2v'
			-- end
			-- local completion = require 'mini.completion'
			local surround = require 'mini.surround'
			local bufremove = require 'mini.bufremove'
			local tabline = require 'mini.tabline'
			local icons = require 'mini.icons'
			local hipatterns = require 'mini.hipatterns'
			local move = require 'mini.move'
			-- local animate = require 'mini.animate'
			icons.setup()
			hipatterns.setup()
			bufremove.setup()
			tabline.setup()
			surround.setup()
			move.setup()
			-- animate.setup()

			-- completion.setup({
			-- 	delay = { completion = 100, info = 100, signature = 50 },
			--
			-- 	-- Configuration for action windows:
			-- 	-- - `height` and `width` are maximum dimensions.
			-- 	-- - `border` defines border (as in `nvim_open_win()`).
			-- 	window = {
			-- 		info = { height = 25, width = 10, border = 'true' },
			-- 		signature = { height = 25, width = 10, border = 'true' },
			-- 	},
			-- })
		end
	},
}
