vim.g.mapleader = " "

require("config.lazy")
require("config.clangd")
require("config.macros")

if vim.g.neovide then
    vim.g.neovide_cursor_vfx_mode = ""
    vim.g.neovide_cursor_smooth_blink = false
    vim.g.neovide_cursor_trail_size = 0.0
    vim.g.neovide_cursor_animate_command_line = false
    vim.g.neovide_cursor_animation_length = 0.0
    vim.g.neovide_position_animation_length = 0.0
    vim.g.neovide_scroll_animation_length = 0.1
    vim.opt.linespace = 1
    vim.g.neovide_scale_factor = 0.9
    vim.g.neovide_padding_top = 10
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0
end

vim.filetype.add({
  extension = {
    h = "c",
    hpp = "cpp",
  },
})

vim.cmd("colorscheme tokyonight")

require('neoterm').setup({
	clear_on_run = true,
	position = 'fullscreen',
	noinsert = false,
	width = 1,
	height = 1,
})
