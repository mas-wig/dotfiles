local M = {}

M.setup = function ()
    local present, noice = pcall(require, "noice")

    if not present then
        return
    end

    noice.setup({
        lsp = {
            progress = {
                enabled = false,
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = false,
            command_palette = true,
            long_message_to_split = true,
            inc_rename = false,
            lsp_doc_border = false,
        },
    })

end

M.keymaps = {
    {"<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline"},
    {"<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message"},
    {"<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History"},
    {"<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All"},
{"<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"}},
{"<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
}

return M
