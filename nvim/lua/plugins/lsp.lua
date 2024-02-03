return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v2.x",
  dependencies = {
    -- LSP Support
    { "neovim/nvim-lspconfig" }, -- Required
    {
      -- Optional
      "williamboman/mason.nvim",
      build = function()
        pcall(vim.cmd, "MasonUpdate")
      end,
    },
    { "williamboman/mason-lspconfig.nvim" }, -- Optional

    -- Autocompletion
    { "hrsh7th/nvim-cmp" }, -- Required
    { "saadparwaiz1/cmp_luasnip" },
    { "hrsh7th/cmp-buffer" }, -- Required
    { "hrsh7th/cmp-path" }, -- Required
    { "hrsh7th/cmp-cmdline" }, -- Required
    { "hrsh7th/cmp-nvim-lsp" }, -- Required
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
    },

    { "folke/neodev.nvim" }, -- Required

    -- Formatting
    { "jose-elias-alvarez/null-ls.nvim" },
  },
  config = function()
    local lsp = require("lsp-zero").preset({})

    lsp.on_attach(function(_, bufnr)
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

    require("lspconfig").arduino_language_server.setup({
      cmd = {
        "arduino-language-server",
        "-cli-config",
        "/Users/rab/Library/Arduino15/arduino-cli.yaml",
        "-fqbn",
        "esp32:esp32:esp32",
        "-cli",
        "/opt/homebrew/bin/arduino-cli",
        "-clangd",
        "/usr/bin/clangd",
      },
    })

    require("lspconfig").yamlls.setup({
      settings = {
        yaml = {
          schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          },
        },
      },
    })

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
      },
      mapping = {
        ["<Tab>"] = cmp_action.tab_complete(),
        ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      },
      sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,

          -- copied from cmp-under, but I don't think I need the plugin for this.
          -- I might add some more of my own.
          function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find("^_+")
            local _, entry2_under = entry2.completion_item.label:find("^_+")
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
              return false
            elseif entry1_under < entry2_under then
              return true
            end
          end,

          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
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
          "ruby",
          "go",
          "arduino",
          "yaml",
        },
      },
    })

    lsp.setup()

    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.astyle,
        null_ls.builtins.code_actions.shellcheck.with({
          filetypes = { "sh", "zsh", "bash" },
        }),
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
  end,
}
