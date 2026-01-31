-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- マウスモードをオフにする
vim.o.mouse = ""

-- これはローカルでのクリップボードプロバイダ (xclip等)向けの設定
-- vim.o.clipboard = "unnamedplus"

-- OSC 52を使ってSSH経由でもローカルPCにコピー可能とする
local function paste()
    return {
        vim.fn.split(vim.fn.getreg(""), "\n"),
        vim.fn.getregtype(""),
    }
end

vim.g.clipboard = {
    name = "OSC 52",
    copy = {
        ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
        ["+"] = require("vim.ui.clipboard.osc52").copy("*"),
    },
    paste = {
        ["+"] = paste,
        ["+"] = paste,
    },
}

-- yでヤンクしたときに+レジスタ(システムクリップボード)を使用する
vim.opt.clipboard:append("unnamedplus")
