return {
    {
        "mfussenegger/nvim-dap",
        optional = true,
        dependencies = {
            -- Ensure C/C++ debugger is installed
            "williamboman/mason.nvim",
            optional = true,
            opts = function(_, opts)
                if type(opts.ensure_installed) == "table" then
                    vim.list_extend(opts.ensure_installed, { "codelldb" })
                end
            end,
        },
        opts = function()
            local dap = require("dap")
            if not dap.adapters["codelldb"] then
                require("dap").adapters["codelldb"] = {
                    type = "server",
                    host = "localhost",
                    port = "${port}",
                    executable = {
                        command = "codelldb",
                        args = {
                            "--port",
                            "${port}",
                        },
                    },
                }
            end
            require("dap.ext.vscode").load_launchjs()
        end,
    },
}
