-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
--

if vim.fn.exists(":CMakeBuild") == 2 then
    vim.keymap.set('n', '<leader>C', "", {desc = "CMake"})
    vim.keymap.set('n', '<leader>Cg', ':CMakeGenerate<CR>', {desc = "Generate"})
    vim.keymap.set('n', '<leader>Cb', ':CMakeBuild<CR>', {desc = "Build"})
    vim.keymap.set('n', '<leader>Cr', ':CMakeRun<CR>', {desc = "Run"})
    vim.keymap.set('n', '<leader>Ct', ':CMakeRunTest<CR>', {desc = "Run Test"})
    vim.keymap.set('n', '<leader>Cd', ':CMakeDebug<CR>', {desc = "Debug"})
end
