return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope-file-browser.nvim" },
    },
    opts = {
        defaults = {
            prompt_prefix = "  ",
            path_display = { "truncate" },
            layout_config = { prompt_position = "top" },
            sorting_strategy = "ascending",
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key",
                },
            },
        },
        extensions = {
            file_browser = {},
        },
    },
    config = function(_, opts)
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>pv", ":Telescope file_browser path=%:p:h<CR>", { desc = "Telescope file browser" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })
        vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "Project search" })
        vim.keymap.set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find({
                sorting_strategy = "ascending",
                layout_config = { prompt_position = "top" },
                previewer = false,
            })
        end, { desc = "Fuzzy Search" })

        require("telescope").setup(opts)
        require("telescope").load_extension("file_browser")
    end,
}
