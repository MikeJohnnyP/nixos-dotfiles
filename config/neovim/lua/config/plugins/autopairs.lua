-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	-- Optional dependency
	config = function()
		require("nvim-autopairs").setup({
			enable_check_bracket_line = true,
			map_cr = true,
		})
	end,
}
