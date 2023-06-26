local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { buffer = true, desc = "Go to definition" })
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = true, desc = "Show references" })
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, { buffer = bufnr, desc = "Show hover" })
end)

lsp.ensure_installed({
    "tsserver",
    "eslint",
    "lua_ls",
})

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
    mapping = {
        ["<Tab>"] = cmp_action.tab_complete(),
        ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
    },
})

lsp.format_mapping("<leader>f", {
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ["null-ls"] = {
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "scss",
            "less",
            "tsx",
            "lua",
            "svelte",
        },
    },
})

lsp.setup()

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettierd.with({
            filetypes = {
                "css",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "json",
                "scss",
                "less",
                "tsx",
                "svelte",
            },
        }),
    },
    autostart = true,
})
