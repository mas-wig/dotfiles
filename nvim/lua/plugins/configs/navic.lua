local M = {}

M.setup = function()
	local present, navic = pcall(require, "nvim-navic")

	if not present then
		return
	end

	navic.setup({
		icons = {
			File = "đ ",
			Module = "đ ",
			Namespace = "đ ",
			Package = "đ ",
			Class = "đĒŠ ",
			Method = "âī¸  ",
			Property = "đŠ ",
			Field = "đĒ ",
			Constructor = "đĻ ",
			Enum = "đ§­ ",
			Interface = "đŽ ",
			Function = "đ§ ",
			Variable = "đŽ ",
			Constant = "đ§ŋ ",
			String = "đ ",
			Number = "đŦ ",
			Boolean = "đ ",
			Array = "đ ",
			Object = "đ ",
			Key = "đ ",
			Null = "đ ",
			EnumMember = "î­ ",
			Struct = "đ§Ž ",
			Event = "îĒ ",
			Operator = "đ ",
			TypeParameter = "đ ",
		},
		highlight = true,
		separator = (" %s "):format("âŽ "),
		depth_limit = 0,
		depth_limit_indicator = "âĻ",
		safe_output = true,
	})
	-- vim.cmd([[highlight WinBar guibg=#263238]])
	vim.api.nvim_create_autocmd({ "CursorMoved", "BufWinEnter", "BufFilePost" }, {
		callback = function()
			local winbar_filetype_exclude = {
				"help",
				"packer",
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
			if vim.api.nvim_win_get_config(0).relative ~= "" then
				return
			end

			if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
				vim.opt_local.winbar = nil
				return
			end

			local winbar = require("nvim-navic").get_location()
			vim.opt_local.winbar = winbar
		end,
	})
end

return M
