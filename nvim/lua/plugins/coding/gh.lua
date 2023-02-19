local M = {}

M.setup = function()
    local present, gh = pcall(require, "litee.gh")
    local _, lib_gh = pcall(require, "litee.lib")

    if not present then
        return
    end

    lib_gh.setup({
        tree = {
            icon_set = "codicons"
        },
        panel = {
            orientation = "left",
            panel_size = 30
        },
    })

    gh.setup({
        jump_mode = "invoking",
        map_resize_keys = false,
        disable_keymaps = false,
        icon_set = "default",
        icon_set_custom = nil,
        git_buffer_completion = true,
        keymaps = {
            open = "<CR>",
            expand = "zo",
            collapse = "zc",
            goto_issue = "gd",
            details = "d",
            submit_comment = "<C-s>",
            actions = "<C-a>",
            resolve_thread = "<C-r>",
            goto_web = "gx" },
    })
end

return M
