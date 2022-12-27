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
}

neotest.setup(options)
