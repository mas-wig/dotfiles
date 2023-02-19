return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = {"BufReadPre", "BufNewFile"},
        config = function ()
            require("plugins.lsp.lspconfig").setup()
        end,
        dependencies = {
            {"folke/neoconf.nvim", cmd = "Neoconf", config = true, lazy = true},
            {"folke/neodev.nvim", opts = {experimental = {pathStrict = true}}, lazy = true},
            {"williamboman/mason-lspconfig.nvim", lazy = true},
            {
                "williamboman/mason.nvim",
                lazy = true,
                config = function ()
                    require("plugins.lsp.mason")
                end
            },
            {
                "hrsh7th/cmp-nvim-lsp",
                lazy = true,
                cond = function()
                    return require("setup.utils").has("nvim-cmp")
                end,
            },
            {
                "glepnir/lspsaga.nvim",
                branch = "main",
                lazy = true,
                keys = require("plugins.lsp.lspsaga").keymaps,
                config = function ()
                    require("plugins.lsp.lspsaga").setup()
                end
            },
        },
    },
}

