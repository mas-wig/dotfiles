local M = {}

M.setup = function()
	local present, navic = pcall(require, "nvim-navic")

	if not present then
		return
	end

	navic.setup({
		icons = {
			File = "📁 ",
			Module = "📜 ",
			Namespace = "🎀 ",
			Package = "📚 ",
			Class = "🪩 ",
			Method = "⚙️  ",
			Property = "🔩 ",
			Field = "🪛 ",
			Constructor = "📦 ",
			Enum = "🧭 ",
			Interface = "🏮 ",
			Function = "🔧 ",
			Variable = "🔮 ",
			Constant = "🧿 ",
			String = "📝 ",
			Number = "🚬 ",
			Boolean = "💊 ",
			Array = "📏 ",
			Object = "🔗 ",
			Key = "🔑 ",
			Null = "📒 ",
			EnumMember = " ",
			Struct = "🧮 ",
			Event = " ",
			Operator = "📉 ",
			TypeParameter = "💈 ",
		},
		highlight = true,
		separator = (" %s "):format("⮞ "),
		depth_limit = 0,
		depth_limit_indicator = "…",
		safe_output = true,
	})
	-- vim.cmd([[highlight WinBar guibg=#263238]])
	vim.api.nvim_create_autocmd(
		{ "WinScrolled", "BufWinEnter", "CursorMoved", "InsertLeave", "BufWritePost", "TextChanged", "TextChangedI" },
		{
			callback = function()
				local winbar_filetype_exclude = {
					"ui",
					"help",
					"packer",
					"input",
					"NvimTree",
					"Trouble",
					"nvterm",
					"Outline",
					"dapui_scopes",
					"dapui_breakpoints",
					"dapui_stacks",
					"dapui_watches",
					"dap-repl",
					"dap-terminal",
					"dapui_console",
					"TelescopePrompt",
					"navigator",
				}

				if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
					vim.opt_local.winbar = nil
					return
				end

				local winbar = require("nvim-navic").get_location()
				vim.opt_local.winbar = winbar
			end,
		}
	)
end

return M
