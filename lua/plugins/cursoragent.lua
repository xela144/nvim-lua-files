return {
	{
		"aug6th/cursoragent.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("cursoragent").setup({})

			local leader = "<leader>c"
			vim.keymap.set("n", leader .. "t", "<cmd>CursorAgent<cr>", { desc = "Cursor Agent: toggle" })
			vim.keymap.set("n", leader .. "p", "<cmd>CursorAgentPrompt<cr>", { desc = "Cursor Agent: plan" })
			vim.keymap.set("n", leader .. "b", "<cmd>CursorAgentBuffer<cr>", { desc = "Cursor Agent: send buffer" })
			vim.keymap.set("v", leader .. "s", ":CursorAgentSelection<cr>", { desc = "Cursor Agent: send selection" })
		end,
	},
}
