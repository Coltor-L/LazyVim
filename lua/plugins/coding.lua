return {
    {
        "neovim/nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
            servers = {
                clangd = {
                    keys = {
                        { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
                    },
                    root_dir = function(fname)
                        return require("lspconfig.util").root_pattern(
                            "Makefile",
                            "configure.ac",
                            "configure.in",
                            "config.h.in",
                            "meson.build",
                            "meson_options.txt",
                            "build.ninja",
                            ".clang-format"
                        )(fname) or require("lspconfig.util").root_pattern(
                            "compile_commands.json",
                            "compile_flags.txt"
                        )(fname) or require("lspconfig.util").find_git_ancestor(fname)
                    end,
                    cmd = {
                        "clangd",
                        "--all-scopes-completion",
                        "--clang-tidy",
                        "--header-insertion=iwyu",
                        "--completion-style=detailed",
                        "--fallback-style=llvm",
                        "--function-arg-placeholders=false",
                    },
                    init_options = {
                        completeUnimported = true,
                        clangdFileStatus = true,
                    },
                },
            },
        },
    },
    {
        "mfussenegger/nvim-dap",
        optional = true,
        opts = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "codelldb" },
                automatic_installation = true,
                handlers = {},
            })
            require("dap.ext.vscode").load_launchjs(nil, { codelldb = { "rust", "c", "cpp" } })
        end,
    },
    {
        "Civitasv/cmake-tools.nvim",
        opts = {
            cmake_executor = { name = "overseer", opts = {} },
            cmake_runner = { name = "overseer", opts = {} },
            cmake_virtual_text_support = false,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "html",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "vim",
                "yaml",
                "rust",
                "c",
                "cpp",
                "xml",
                "latex",
                "glsl",
                "http",
            },
        },
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                -- lsp
                "clangd",
                "json-lsp",
                "lua-language-server",
                "neocmakelsp",
                "pyright",
                "ruff-lsp",
                "lemminx",
                "codelldb",
                "debugpy",
                -- linter
                "cmakelang",
                "flake8", -- does ruff-lsp replace?
                "shellcheck",
                -- formatter
                "xmlformatter",
                "clang-format",
                "cmakelang",
                "stylua",
                "shfmt",
            },
        },
    },
    {
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        init = function()
            vim.g.VM_set_statusline = 0
        end,
    },
    {
        "folke/flash.nvim",
        opts = {
            search = {
                multi_window = false,
            },
            modes = {
                char = {
                    multi_line = false,
                    highlight = { backdrop = false },
                },
            },
        },
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            vim.o.foldcolumn = "1"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
            vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
            vim.keymap.set("n", "zk", function()
                local winid = require("ufo").peekFoldedLinesUnderCursor()
                if not winid then
                    vim.lsp.buf.hover()
                end
            end, { desc = "peek Fold" })

            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "lsp", "indent" }
                end,
            })
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        keys = {
            {
                "<leader>cp",
                ft = "markdown",
                "<cmd>MarkdownPreviewToggle<cr>",
                desc = "Markdown Preview",
            },
        },
        config = function()
            vim.cmd([[do FileType]])
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        opts = {
            show_success_message = true,
            prompt_func_return_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
            prompt_func_param_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
        },
        keys = {
            {
                "<leader>r",
                desc = "refactor+",
                mode = { "x", "n" },
            },
            {
                "<leader>rf",
                desc = "Extract to Function",
                function()
                    require("refactoring").refactor("Extract Function")
                end,
                mode = { "x" },
            },
            {
                "<leader>rF",
                function()
                    require("refactoring").refactor("Extract Function To File")
                end,
                desc = "Extract to Function to File",
                mode = { "x" },
            },
            {
                "<leader>rv",
                function()
                    require("refactoring").refactor("Extract Variable")
                end,
                desc = "Extract to Variable",
                mode = { "x" },
            },
            {
                "<leader>rI",
                function()
                    require("refactoring").refactor("Inline Function")
                end,
                desc = "Inline Function",
                mode = { "n" },
            },
            {
                "<leader>ri",
                ":Refactor inline_var",
                desc = "Inline Variable",
                mode = { "n" },
            },
            {
                "<leader>rb",
                function()
                    require("refactoring").refactor("Extract Block")
                end,
                desc = "Extract Block",
                mode = { "n" },
            },
            {
                "<leader>rB",
                function()
                    require("refactoring").refactor("Extract Block To File")
                end,
                desc = "Extract Block to File",
                mode = { "n" },
            },
        },
    },
}
