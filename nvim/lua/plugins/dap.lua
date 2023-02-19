return {
    {
        "mfussenegger/nvim-dap",
        lazy = true,
        keys = require("plugins.dap.dap").keymaps,
        dependencies = {
            {"theHamsta/nvim-dap-virtual-text", lazy = true, },
            {"rcarriga/nvim-dap-ui", lazy = true,
                config = function ()
                    require("plugins.dap.dapui")
                end
            },
        },
        config = function ()
            require("plugins.dap.dap").setup()
        end
    },
}
