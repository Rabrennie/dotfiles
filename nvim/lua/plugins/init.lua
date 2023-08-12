return {
  {
    "olimorris/onedarkpro.nvim",
    config = function()
      vim.cmd("colorscheme onedark")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query", "svelte" },
      sync_install = false,
      auto_install = true,
      ignore_install = {},
      highlight = {
        enable = true,
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  "nvim-treesitter/nvim-treesitter-context",
  {
    "ThePrimeagen/harpoon",
    config = function()
      local mark = require("harpoon.mark")
      local ui = require("harpoon.ui")

      require("telescope").load_extension("harpoon")

      vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file" })
      vim.keymap.set("n", "<C-e>", "<cmd>Telescope harpoon marks<cr>", { desc = "Show harpoon marks" })
    end,
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>u", vim.cmd.UndotreeToggle, desc = "undo tree" },
    },
  },
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>gs", vim.cmd.Git, desc = "Git status" },
    },
  },
  "gpanders/editorconfig.nvim",
  "rafamadriz/friendly-snippets",

  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },

  {
    "folke/flash.nvim",
    config = function()
      require("flash").setup({})
      vim.keymap.set({ "n", "x", "o" }, "s", function()
        require("flash").jump()
      end, { desc = "Flash" })
      vim.keymap.set({ "n", "o", "x" }, "S", function()
        require("flash").treesitter()
      end, { desc = "Flash Treesitter" })
      vim.keymap.set("o", "r", function()
        require("flash").remote()
      end, { desc = "Remote Flash" })
      vim.keymap.set({ "o", "x" }, "R", function()
        require("flash").treesitter_search()
      end, { desc = "Treesitter Search" })
      vim.keymap.set({ "c" }, "<c-s>", function()
        require("flash").toggle()
      end, { desc = "Toggle Flash Search" })
    end,
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup()
    end,
  },

  {
    "aserowy/tmux.nvim",
    config = function()
      return require("tmux").setup()
    end,
  },

  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.keymap.set("i", "<C-f>", 'copilot#Accept("<CR>")', { silent = true, expr = true, replace_keycodes = false })
      vim.keymap.set("i", "<C-t>", "<Plug>(copilot-next)", { silent = true, noremap = true })
      vim.keymap.set("i", "<C-\\>", "<Plug>(copilot-suggest)", { silent = true, noremap = true })
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  }
}
