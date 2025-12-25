return {
	"nvim-tree/nvim-tree.lua",
	enabled = false,
	dependencies = {
		-- https://github.com/nvim-tree/nvim-web-devicons
		"nvim-tree/nvim-web-devicons", -- Fancy icon support
	},
	config = function()
		-- vim.keymap.set("n", "\\", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle [E]xplorer" })
		-- require("nvim-tree").setup({
		-- 	hijack_netrw = true,
		-- 	auto_reload_on_write = true,
		-- })
	end,
}
