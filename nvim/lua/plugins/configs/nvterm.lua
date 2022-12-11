local present, nvterm = pcall(require, "nvterm")

if not present then
    return
end

local options = {
    terminals = {
        list = {},
        type_opts = {
            float = {
                relative = "editor",
                row = 0.15,
                col = 0.15,
                width = 0.70,
                height = 0.70,
                border = "rounded",
            },
            horizontal = { location = "rightbelow", split_ratio = 0.3 },
            vertical = { location = "rightbelow", split_ratio = 0.35 },
        },
    },
    behavior = {
        close_on_exit = true,
        auto_insert = true,
    },
    enable_new_mappings = true,
}

nvterm.setup(options)
