-- Autocmds for setting iundentation per filetype
local indent_group = vim.api.nvim_create_augroup("IndentSettings", { clear = true })

-- C/C++
vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = { "cpp", "c", "objc", "cuda" },
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
  end,
})

-- Python
vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
    vim.bo.expandtab = true
  end,
})

-- Bash
vim.api.nvim_create_autocmd("FileType", {
  group = indent_group,
  pattern = "sh",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})
