-- leaderキーの設定
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

-- -- LSPの設定
-- -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- -- Python LSP
-- require("lspconfig").pyright.setup({
--   -- capabilities = capabilities,
-- })
-- -- C/C++ LSP
-- require("lspconfig").clangd.setup({
--   -- capabilities = capabilities,
--   cmd = {
--     "clangd",
--     "--background-index",
--     "--suggest-missing-includes",
--     "--clang-tidy",
--     "--header-insertion=iwyu",
--   },
--   filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
-- })

-- -- フォーマット時の自動保存の設定
-- vim.cmd([[
--   augroup FormatAutogroup
--     autocmd!
--     autocmd BufWritePre *.py,*.c,*.cpp,*.hpp,*.h lua vim.lsp.buf.format()
--   augroup END
-- ]])
--
-- -- キーマッピングの設定
-- local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "<space>f", function()
--   vim.lsp.buf.format()
-- end, opts)
