local M = {}
M.setup = function()
	local present, wk = pcall(require, "which-key")

	if not present then
		return
	end

	local options = {
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
	}
	wk.setup(options)

	local mappings = require("core.mappings")
	if not present then
		return
	end

	for _, k in pairs(mappings) do
		for v, x in pairs(k) do
			wk.register(x, { mode = v })
		end
	end
end

return M
