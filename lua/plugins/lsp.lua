return {
    "neovim/nvim-lspconfig",
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        -- change a keymap
        keys[#keys + 1] = { "<C-n>", "<Tab>" }
    end,
}
