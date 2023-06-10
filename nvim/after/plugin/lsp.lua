local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	lsp.default_keymaps({buffer = bufnr})
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

-- (Optional) Configure lua language server for neovim

lsp.ensure_installed({
	'tsserver',
	'eslint',
	'lua_ls'
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = {
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
		['<CR>'] = cmp.mapping.confirm({ select = false })
	}
})

lsp.setup()
