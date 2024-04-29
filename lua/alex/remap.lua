-- Navigate windows with ctrl-jkhl
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")

-- Move visual blocks and preserve indentation w.r.t. control blocks
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Combine lines but keep cursor at front of line
vim.keymap.set("n", "J", "mzJ`z")

-- Search but keep the cursor in the middle of the screen
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Don't overwrite buffer when pasting over another
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system with leader
vim.keymap.set({ "n", "v" }, "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Use tmux to hop around sessions? Not working...
vim.keymap.set("n", "<C-f>", "<cmd> !tmux neww tmux-sessionizer<CR>")

-- Edit all occurrances of current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set current file's executable bit
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- make it rain, game of life
vim.keymap.set("n", "<leader>mr", ":CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>gl", ":CellularAutomaton game_of_life<CR>")

-- Use black formatter for python code
vim.keymap.set("n", "<leader>bl", ":!black % --line-length=100<CR>")

-- LSP server
vim.keymap.set("n", "<leader>lsr", ":LspRestart<CR>")
vim.keymap.set("n", "<leader>lss", ":LspStop<CR>")
