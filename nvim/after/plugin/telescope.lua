local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope git files" })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Project search" })
vim.keymap.set("n", "<leader>/", function()
    builtin.current_buffer_fuzzy_find {
        sorting_strategy = "ascending",
        layout_config = { prompt_position = "top" },
        previewer = false,
    }
end, { desc = "Fuzzy Search" })
