local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

require("telescope").load_extension("harpoon")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file" })
vim.keymap.set("n", "<C-e>", "<cmd>Telescope harpoon marks<cr>", { desc = "Show harpoon marks" })
