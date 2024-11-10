require("config.lazy")

-- leaderキーの設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- プラグインの設定
require("lazy").setup({
  -- mason
  {
    "williamboman/mason.nvim",
    priority = 100, -- 優先度を高く設定
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "pyright", -- Python
          "clangd", -- C/C++
        },
        automatic_installation = true,
      })
    end,
  },

  -- 補完
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },
  -- none-ls関連
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("none-ls")
      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        sources = {
          formatting.black,
          diagnostics.flake8,
          formatting.clang_format,
        },
      })
    end,
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "black",
          "flake8",
          "clang-format",
        },
        automatic_installation = true,
      })
    end,
  },
})

-- 補完の設定
local cmp = require("cmp")
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = "nvim_lsp" },
  },
})

-- LSPの設定
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python LSP
require("lspconfig").pyright.setup({
  capabilities = capabilities,
})

-- C/C++ LSP
require("lspconfig").clangd.setup({
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--suggest-missing-includes",
    "--clang-tidy",
    "--header-insertion=iwyu",
  },
})

-- フォーマット時の自動保存の設定
vim.cmd([[
  augroup FormatAutogroup
    autocmd!
    autocmd BufWritePre *.py,*.c,*.cpp,*.hpp,*.h lua vim.lsp.buf.format()
  augroup END
]])

-- キーマッピングの設定
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>f", function()
  vim.lsp.buf.format()
end, opts)