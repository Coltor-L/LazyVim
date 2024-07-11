-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4
vim.o.expandtab = true
vim.opt.conceallevel = 0
vim.opt.wrap = false
vim.g.moonflyNormalFloat = true
vim.g.moonflyCursorColor = true
vim.g.moonflyUnderlineMatchParen = true
vim.g.moonflyVirtualTextColor = true
vim.g.moonflyWinSeparator = 2
vim.opt.fillchars = {
    horiz = "━",
    horizup = "┻",
    horizdown = "┳",
    vert = "┃",
    vertleft = "┫",
    vertright = "┣",
    verthoriz = "╋",
}

vim.g.autoformat = false
vim.o.pumblend = 0

vim.filetype.add({ extension = { vertex = "glsl", frag = "glsl" } })

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatureHelp, {
    border = "single",
})
vim.diagnostic.config({ float = { border = "single" } })

local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "moonfly",
    callback = function()
        vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "NONE", fg = "#949494" })

        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { bg = "NONE", fg = "#ff5454" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { bg = "NONE", fg = "#e3c78a" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { bg = "NONE", fg = "#74b2ff" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { bg = "NONE", fg = "#79dac8" })
        vim.api.nvim_set_hl(0, "DiagnosticVirtualTextOk", { bg = "NONE", fg = "#36c692" })
    end,
    group = custom_highlight,
})

vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.o.smartcase = false
vim.o.ignorecase = false
vim.opt.background = 'dark'
vim.o.autowrite = true
vim.o.autowriteall = true

vim.opt.swapfile = false -- sue me
