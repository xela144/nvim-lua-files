return {
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- Whole-line tint: additions / deletions / changes (theme links GitSigns*Ln)
			linehl = false,
			numhl = false,
			signcolumn = true,
			current_line_blame = false,
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end

				-- Same keys as built-in diffjump when in diff mode; otherwise jump hunks
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.next_hunk()
					end
				end, "Next hunk / diff change")

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.prev_hunk()
					end
				end, "Previous hunk / diff change")

				map("n", "<leader>gl", gitsigns.toggle_linehl, "Toggle green/red line highlights")
				-- map("n", "<leader>gL", gitsigns.preview_hunk_inline, "Preview hunk (inline)")
			end,
		},
	},
}
