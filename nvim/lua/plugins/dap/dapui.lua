local present_dap, dap = pcall(require, "dap")
local present_dui, dap_ui = pcall(require, "dapui")

if not (present_dap and present_dui) then
    return
end

local options = {
    icons = {expanded = "🔻", collapsed = "🔺"},
    mappings = {
        expand = {"<CR>", "<2-LeftMouse>"},
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "rounded", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = {"q", "<Esc>"},
        },
    },
    layouts = {
        {
            elements = {
                {id = "watches", size = 0.20},
                {id = "stacks", size = 0.20},
                {id = "breakpoints", size = 0.20},
                {id = "scopes", size = 0.40},
            },
            size = 64,
            position = "right",
        },
        {
            elements = {
                "repl",
                "console",
            },
            size = 0.20,
            position = "bottom",
        },
    },
}

dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dap_ui.close()
    dap.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dap_ui.close()
    dap.repl.close()
end

dap_ui.setup(options)
