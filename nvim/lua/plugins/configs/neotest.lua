local present, neotest = pcall(require, "neotest")

if not present then
    return
end

local options = {
    adapters = {
        require("neotest-python")({
            dap = { justMyCode = false },
            runner = "unittest",
        }),
        require("neotest-jest"),
        require("neotest-go"),
    },
    consumers = {
        overseer = require("neotest.consumers.overseer"),
    },
    overseer = {
        enabled = true,
        force_default = false,
    },
}

neotest.setup(options)
