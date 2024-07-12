return {
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "moonfly",
        },
    },
    {
        "folke/trouble.nvim",
        opts = { use_diagnostic_signs = true },
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        config = true,
    },
    {
        "ibhagwan/fzf-lua",
        config = function()
            require("fzf-lua").setup({
                "max-perf",
                default_previewer = "builtin",
                fzf_colors = true,
                previewers = {
                    builtin = {
                        scrollbar = false,
                    },
                },
                fzf_opts = {
                    ["--no-multi"] = true,
                    ["--cycle"] = true,
                    ["--exact"] = true,
                },
                keymap = {
                    builtin = {
                        ["<F1>"] = "toggle-help",
                        ["<F2>"] = "toggle-fullscreen",
                        ["<F3>"] = "toggle-preview-wrap",
                        ["<F4>"] = "toggle-preview",
                        ["<F5>"] = "toggle-preview-ccw",
                        ["<F6>"] = "toggle-preview-cw",
                        ["<S-down>"] = "preview-page-down",
                        ["<S-up>"] = "preview-page-up",
                        ["<S-left>"] = "preview-page-reset",
                    },
                    fzf = {
                        ["tab"] = "down",
                        ["shift-tab"] = "up",
                        ["ctrl-z"] = "abort",
                        ["ctrl-u"] = "unix-line-discard",
                        ["ctrl-f"] = "half-page-down",
                        ["ctrl-b"] = "half-page-up",
                        ["ctrl-a"] = "beginning-of-line",
                        ["ctrl-e"] = "end-of-line",
                        ["alt-a"] = "toggle-all",
                        ["f3"] = "toggle-preview-wrap",
                        ["f4"] = "toggle-preview",
                        ["shift-down"] = "preview-page-down",
                        ["shift-up"] = "preview-page-up",
                    },
                },
            })
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local cmp = require("cmp")

            local win_opt = {
                winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
            }
            opts.window = {
                completion = cmp.config.window.bordered(win_opt),
                documentation = cmp.config.window.bordered(win_opt),
            }
            opts.window.completion.scrollbar = true

            opts.completion.completeopt = "menu,menuone,noselect"
            opts.completion.keyword_length = 1

            opts.matching = {
                disallow_fuzzy_matching = true,
                disallow_fullfuzzy_matching = true,
                disallow_partial_fuzzy_matching = true,
                disallow_partial_matching = true,
                disallow_prefix_unmatching = false,
                disallow_symbol_nonprefix_matching = true,
            }

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<CR>"] = cmp.mapping.confirm(),
            })
        end,
    },
    {
        "hrsh7th/cmp-cmdline",
        after = "nvim-cmp", -- Ensure it loads after nvim-cmp
        config = function()
            local cmp = require("cmp")
            cmp.setup.cmdline(":", {
                sources = {
                    { name = "cmdline" },
                },
                mapping = cmp.mapping.preset.cmdline({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end),
                    ["<CR>"] = cmp.mapping.confirm(),
                }),
            })
            cmp.setup.cmdline("/", {
                sources = {
                    { name = "buffer" },
                },
                mapping = cmp.mapping.preset.cmdline({
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
                        else
                            fallback()
                        end
                    end),
                    ["<CR>"] = cmp.mapping.confirm(),
                }),
            })
        end,
    },
}
