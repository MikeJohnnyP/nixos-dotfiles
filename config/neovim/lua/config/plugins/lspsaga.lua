return {
	'nvimdev/lspsaga.nvim',
	enabled = true,
	config = function()
		require('lspsaga').setup({
			lightbulb = {
				enable = false,
			},
			symbol_in_winbar = {
				enable = false
			},
			vim.keymap.set("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Code Action" }),
			vim.keymap.set("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", { desc = "Outline" }),
			vim.keymap.set("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { desc = "Rename" }),
			vim.keymap.set("n", "<leader>ld", "<cmd>Lspsaga goto_definition<cr>", { desc = "Lsp GoTo Definition" }),
			vim.keymap.set("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", { desc = "Lsp Finder" }),
			vim.keymap.set("n", "<leader>lm", "<cmd>Lspsaga peek_definition<cr>", { desc = "Preview Definition" }),
			-- vim.keymap.set("n", "<leader>ls", "<cmd>Lspsaga signature_help<cr>", { desc = "Signature Help" }),
			--vim.keymap.set("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<cr>",
			--	{ desc = "Show Workspace Diagnostics" })
		})
	end,
}
