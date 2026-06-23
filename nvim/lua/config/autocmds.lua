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
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client.server_capabilities.semanticTokensProvider then
            client.server_capabilities.semanticTokensProvider = nil
        end
    end,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
        vim.diagnostic.config({
            underline = false,
            virtual_text = false,
        })
    end,
})
