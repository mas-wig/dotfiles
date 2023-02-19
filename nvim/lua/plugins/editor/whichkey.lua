local present, wk = pcall(require, "which-key")

if not present then
    return
end

wk.setup({
    icons = {

        breadcrumb = " 🌐",
        separator = " 🡆 ",
        group = "🔰 ",
    },
    popup_mappings = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
    },
    window = {
        border = "single", -- none/single/double/shadow
    },
    layout = {
        spacing = 6, -- spacing between columns
    },
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    },
})
