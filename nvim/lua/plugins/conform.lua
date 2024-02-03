return {
  "stevearc/conform.nvim",
  opts = {},
  config = function(_, _)
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        ruby = { "rubocop" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        javascriptreact = { "prettierd" },
      },
    })

    vim.keymap.set("n", "<leader>cf", "<cmd>lua require('conform').format({ async = true })<cr>", { noremap = true })
  end,
}
