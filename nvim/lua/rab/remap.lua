vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project view - show explore" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text down" })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous centered" })

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without buffer" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Substitute all" })

vim.keymap.set("n", "<C-h>", "<C-W>h", { desc = "Move cursor left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move cursor down window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move cursor up window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move cursor right window" })
