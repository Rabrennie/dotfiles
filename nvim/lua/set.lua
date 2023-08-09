vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = false

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.g.mapleader = " "

vim.opt.listchars = "tab:→\\ ,nbsp:␣,extends:⟩,precedes:⟨,space:·"
vim.opt.list = true

vim.g.netrw_banner = false
-- vim.g.netrw_liststyle = 3
-- vim.g.netrw_winsize = 20
-- vim.g.netrw_browse_split = 0
