local present, runner = pcall(require, "code_runner")

if not present then
    return
end

local options = {
    mode = "term",
    focus = true,
    startinsert = false,
    term = {
        position = "vert", -- bot,horz
        size = 55,
    },
    float = {
        border = "rounded",
        height = 0.8,
        width = 0.8,
        x = 0.5,
        y = 0.5,
        border_hl = "FloatBorder",
        float_hl = "Normal",
        blend = 0,
    },
    filetype_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/code_runner.nvim/lua/code_runner/code_runner.json",
    filetype = {},
    project_path = vim.fn.stdpath("data")
        .. "/site/pack/packer/opt/code_runner.nvim/lua/code_runner/project_manager.json",
    project = {},
}

runner.setup(options)
