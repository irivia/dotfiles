local hl = vim.api.nvim_set_hl
local colors = {
    keywords  = "#ddc9c0",
    types     = "#8ecae6",
    constants = "#fdfaf1",
    variables = "#eeeeee",
    macros    = "#f4978e",
    functions = "#afe3b2",
    numbers   = "#dad7cd",
    strings   = "#c3e88d",
}
return {
    c_hl = function()
        hl(0, "@keyword.import", {link = "@keyword"})
        hl(0, "@keyword.modifier", {link = "@keyword"})
        hl(0, "@keyword.type", {link = "@keyword"})
        hl(0, "@keyword.repeat", {link = "@keyword"})
        hl(0, "@keyword.conditional", {link = "@keyword"})
        hl(0, "@keyword.directive", {link = "@keyword"})
        hl(0, "@keyword.directive.define", {link = "@keyword"})

        hl(0, "@lsp.typemod.type.defaultLibrary.c", {link = "@type"})
        hl(0, "@lsp.typemod.macro.globalScope.c", {link = "@type"})
        hl(0, "@lsp.typemod.class.globalScope.c", {link = "@type"})
        hl(0, "@type.builtin", {link = "@type"})
        hl(0, "@lsp.type.macro", {link = "@type"})
        hl(0, "@lsp.typemod.enum.globalScope.c", {link = "@type"})
        hl(0, "@type.definition", {link = "@type"})

        hl(0, "@boolean", {link = "@constant"})
        hl(0, "@constant.builtin", {link = "@constant"})
        hl(0, "@constant.builtin.c", {link = "@constant"})

        hl(0, "@property", {link = "@variable"})
        hl(0, "@variable.parameter", {link = "@variable"})
        hl(0, "@lsp.typemod.variable.static", {link = "@variable"})
        hl(0, "@lsp.typemod.variable.usedAsMutablePointer", {link = "@variable"})

        hl(0, "@function.macro", {link = "@function"})
        hl(0, "@lsp.typemod.function.defaultLibrary", {link = "@function"})
        hl(0, "@lsp.typemod.function.globalScope", {link = "@function"})

        hl(0, "@lsp.typemod.macro.declaration.c", {link = "@constant.macro"})
        hl(0, "@lsp.mod.globalScope.c", {link = "@constant.macro"})

        hl(0, "@keyword",  {fg = colors.keywords, force = true})
        hl(0, "@type",     {fg = colors.types, force = true})
        hl(0, "@constant", {fg = colors.constants, force = true})
        hl(0, "@variable", {fg = colors.variables, force = true})
        hl(0, "@function", {fg = colors.functions, force = true})
        hl(0, "@constant.macro", {fg = colors.macros, force = true})
        hl(0, "@string", {fg = colors.strings, force = true})
        hl(0, "@number", {fg = colors.numbers, force = true})
    end,
}
