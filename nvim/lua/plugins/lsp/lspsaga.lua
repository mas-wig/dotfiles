local M = {}

M.setup = function ()
    local present, lspsaga = pcall(require, "lspsaga")

    if not present then
        return
    end

    return lspsaga.setup({
        preview = {
            lines_above = 0,
            lines_below = 10,
        },
        scroll_preview = {
            scroll_down = "<C-f>",
            scroll_up = "<C-b>",
        },
        request_timeout = 2000,

        symbol_in_winbar = {
            enable = false,
        },
        ui = {
            theme = "round",
            title = true,
            border = "rounded",
            winblend = 0,
            expand = "",
            collapse = "",
            preview = " ",
            code_action = "💡",
            diagnostic = "🐞",
            incoming = " ",
            outgoing = " ",
            hover = ' ',
            kind = {},
        },
    })

end

M.keymaps = {
    {"gh", "<cmd>Lspsaga lsp_finder<CR>", desc = "lsp finder"},
    {"<leader>ca", "<cmd>Lspsaga code_action<CR>", mode = {"n", "v"}, desc = "code action"},
    {"gr", "<cmd>Lspsaga rename<CR>", desc = "rename"},
    {"gr", "<cmd>Lspsaga rename ++project<CR>", desc = "rename project"},
    {"gd", "<cmd>Lspsaga peek_definition<CR>", desc = "peek definition"},
    {"gd", "<cmd>Lspsaga goto_definition<CR>", desc = "goto definition"},
    {"gt", "<cmd>Lspsaga peek_type_definition<CR>", desc = "peek type definition"},
    {"gt", "<cmd>Lspsaga goto_type_definition<CR>", desc = "goto type definition"},
    {"<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", desc = "line diagnostics"},
    {"<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>", desc = "cursor diagnostics"},
    {"<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>", desc = ""},
    {"[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "diagnostic jump prev"},
    {"]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "diagnostic jump next"},
    {"[E", function()
        require("lspsaga.diagnostic"):goto_prev({severity = vim.diagnostic.severity.ERROR})
    end, desc = "goto prev error"},
    {"]E", function()
        require("lspsaga.diagnostic"):goto_next({severity = vim.diagnostic.severity.ERROR})
    end, desc = "goto next error"},
    {"<leader>o", "<cmd>Lspsaga outline<CR>", desc = "lsp outline"},
    {"K", "<cmd>Lspsaga hover_doc<CR>", desc = "hover doc"},
    -- {"K", "<cmd>Lspsaga hover_doc ++keep<CR>", desc = "hover doc keep"},

    {"<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>", desc = "incoming calls"},
    {"<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>", desc = "outgoing calls"},
    {"<A-d>", "<cmd>Lspsaga term_toggle<CR>", mode = {"n", "t"}, desc = "term toggle"},
}

return M
