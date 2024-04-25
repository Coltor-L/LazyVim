-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4
vim.opt.conceallevel = 0
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.wrap = false
vim.g.moonflyTransparent = true

vim.o.foldcolumn = "0" -- '0' is not bad
vim.o.foldlevel = 20 -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 20
vim.o.foldminlines = 0
vim.o.foldenable = true
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
vim.opt.foldmethod = "expr"

vim.filetype.add({ extension = { vertex = "glsl", frag = "glsl" } })
