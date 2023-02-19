local M = {}

M.setup = function()
    local present, trouble = pcall(require, "trouble")

    if not present then
        return
    end

    return trouble.setup({
            position = "bottom",
            height = 10,
            width = 50,
            icons = true,
            mode = "workspace_diagnostics",
            fold_open = "",
            fold_closed = "",
            group = true,
            padding = true,
            action_keys = {
                close = "q",
                cancel = "<esc>",
                refresh = "r",
                jump = { "<cr>", "<tab>" },
                open_split = { "<c-x>" },
                open_vsplit = { "<c-v>" },
                open_tab = { "<c-t>" },
                jump_close = { "o" },
                toggle_mode = "m",
                toggle_preview = "P",
                hover = "K",
                preview = "p",
                close_folds = { "zM", "zm" },
                open_folds = { "zR", "zr" },
                toggle_fold = { "zA", "za" },
                previous = "k",
                next = "j"
            },
            indent_lines = true,
            auto_open = false,
            auto_close = false,
            auto_preview = true,
            auto_fold = false,
            auto_jump = { "lsp_definitions" },
            signs = {
                error = "",
                warning = "",
                hint = "",
                information = "",
                other = "﫠"
            },
            use_diagnostic_signs = false
        })
end

M.keymaps = function()
    return {
        { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
        { "<leader>xX", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
        { "<leader>xL", "<cmd>TroubleToggle loclist<cr>",               desc = "Location List (Trouble)" },
        { "<leader>xQ", "<cmd>TroubleToggle quickfix<cr>",              desc = "Quickfix List (Trouble)" },
    }
end

return M
