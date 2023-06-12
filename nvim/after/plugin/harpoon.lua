local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("telescope").load_extension('harpoon')

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file" })
vim.keymap.set("n", "<C-e>", "<cmd>Telescope harpoon marks<cr>", { desc = "Show harpoon marks" })

vim.keymap.set("n", "<C-h>", function () ui.nav_file(1) end)
vim.keymap.set("n", "<C-t>", function () ui.nav_file(2) end)
vim.keymap.set("n", "<C-n>", function () ui.nav_file(3) end)
vim.keymap.set("n", "<C-s>", function () ui.nav_file(4) end)
