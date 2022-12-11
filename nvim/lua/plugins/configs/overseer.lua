local present, overseer = pcall(require, "overseer")

if not present then
    return
end

local options = {
    strategy = "terminal",
    templates = { "builtin" },
    auto_detect_success_color = true,
    dap = true,
    task_list = {
        default_detail = 1,
        max_width = { 100, 0.2 },
        min_width = { 40, 0.1 },
        width = nil,
        separator = "────────────────────────────────────────",
        direction = "left",
        bindings = {
            ["?"] = "ShowHelp",
            ["<CR>"] = "RunAction",
            ["<C-e>"] = "Edit",
            ["o"] = "Open",
            ["<C-v>"] = "OpenVsplit",
            ["<C-s>"] = "OpenSplit",
            ["<C-f>"] = "OpenFloat",
            ["p"] = "TogglePreview",
            ["<C-l>"] = "IncreaseDetail",
            ["<C-h>"] = "DecreaseDetail",
            ["L"] = "IncreaseAllDetail",
            ["H"] = "DecreaseAllDetail",
            ["["] = "DecreaseWidth",
            ["]"] = "IncreaseWidth",
            ["{"] = "PrevTask",
            ["}"] = "NextTask",
        },
    },
    actions = {},
    form = {
        border = "rounded",
        zindex = 40,
        min_width = 80,
        max_width = 0.9,
        width = nil,
        min_height = 10,
        max_height = 0.9,
        height = nil,
        win_opts = {
            winblend = 10,
        },
    },
    task_launcher = {
        bindings = {
            i = {
                ["<C-s>"] = "Submit",
            },
            n = {
                ["<CR>"] = "Submit",
                ["<C-s>"] = "Submit",
                ["?"] = "ShowHelp",
            },
        },
    },
    task_editor = {
        bindings = {
            i = {
                ["<CR>"] = "NextOrSubmit",
                ["<C-s>"] = "Submit",
                ["<Tab>"] = "Next",
                ["<S-Tab>"] = "Prev",
            },
            n = {
                ["<CR>"] = "NextOrSubmit",
                ["<C-s>"] = "Submit",
                ["<Tab>"] = "Next",
                ["<S-Tab>"] = "Prev",
                ["?"] = "ShowHelp",
            },
        },
    },
    -- Configure the floating window used for confirmation prompts
    confirm = {
        border = "rounded",
        zindex = 40,
        min_width = 80,
        max_width = 0.5,
        width = nil,
        min_height = 10,
        max_height = 0.9,
        height = nil,
        -- Set any window options here (e.g. winhighlight)
        win_opts = {
            winblend = 10,
        },
    },
    task_win = {
        -- How much space to leave around the floating window
        padding = 2,
        border = "rounded",
        -- Set any window options here (e.g. winhighlight)
        win_opts = {
            winblend = 10,
        },
    },
    -- Aliases for bundles of components. Redefine the builtins, or create your own.
    component_aliases = {
        -- Most tasks are initialized with the default components
        default = {
            "on_output_summarize",
            "on_exit_set_status",
            "on_complete_notify",
            "on_complete_dispose",
        },
    },
    -- This is run before creating tasks from a template
    pre_task_hook = function(task_defn, util)
    end,
    preload_components = {},
    log = {
        {
            type = "echo",
            level = vim.log.levels.WARN,
        },
        {
            type = "file",
            filename = "overseer.log",
            level = vim.log.levels.WARN,
        },
    },
}

overseer.setup(options)
