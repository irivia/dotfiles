-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local highlights = require("config.highlights")

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "*", "c", "cpp"},
    callback = highlights.c_hl,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        vim.diagnostic.config({
            underline = false,
            virtual_text = false,
        })
    end,
})
