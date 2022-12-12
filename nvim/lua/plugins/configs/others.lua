local M = {}
M.colorizer = function()
	local present, colorizer = pcall(require, "colorizer")
	if not present then
		return
	end

	local options = {
		filetypes = {
			"*",
		},
		user_default_options = {
			RGB = true,
			RRGGBB = true,
			names = true,
			RRGGBBAA = false,
			rgb_fn = true,
			hsl_fn = true,
			css = true,
			css_fn = true,
			mode = "background",
		},
	}
	colorizer.setup(options)
	vim.cmd("ColorizerAttachToBuffer")
end

M.autopairs = function()
	local present_a, autopairs = pcall(require, "nvim-autopairs")
	local present_b, cmp = pcall(require, "cmp")

	if not (present_a and present_b) then
		return
	end

	local options = {
		fast_wrap = {},
		disable_filetype = { "TelescopePrompt", "guihua", "guihua_rust", "clap_input" },
	}

	autopairs.setup(options)

	local presentC, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

	if not presentC then
		return
	end

	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

M.pretty_fold = function()
	require("pretty-fold").setup({
		keep_indentation = false,
		fill_char = "━",
		sections = {
			left = {
				"━ ",
				function()
					return string.rep("🎲", vim.v.foldlevel)
				end,
				" ━┫",
				"content",
				"┣",
			},
			right = {
				"┫ ",
				"number_of_folded_lines",
				": ",
				"percentage",
				" ┣━━",
			},
		},
	})
end

M.iblankline = function()
	local present, indent_blankline = pcall(require, "indent_blankline")

	if not present then
		return
	end

	indent_blankline.setup({
		space_char_blankline = " ",
		show_current_context = true,
		show_current_context_start = true,
	})
	-- vim.g.indent_blankline_char = ""
	vim.g.indent_blankline_use_treesitter = true
	-- vim.g.indent_blankline_context_char = "|"
	vim.cmd([[ 
		highlight IndentBlanklineContextChar guifg=#e60073 gui=nocombine
		highlight IndentBlanklineContextStart guisp=#e60073 gui=underline
		]])
end

M.trouble = function()
	local present, trouble = pcall(require, "trouble")
	if not present then
		return
	end

	local cfg = {
		position = "bottom",
		height = 10,
		width = 50,
		mode = "workspace_diagnostics",
		fold_open = "",
		fold_closed = "",
		group = true,
		padding = true,
		action_keys = { -- key mappings for actions in the trouble list
			-- map to {} to remove a mapping, for example:
			-- close = {},
			close = "q",
			cancel = "<esc>",
			refresh = "r",
			jump = { "<cr>", "<tab>" },
			open_split = { "<c-x>" },
			open_vsplit = { "<c-v>" },
			open_tab = { "<c-t>" },
			jump_close = { "o" },
			toggle_mode = "m",
			toggle_preview = "P",
			hover = "K",
			preview = "p",
			close_folds = { "zM", "zm" },
			open_folds = { "zR", "zr" },
			toggle_fold = { "zA", "za" },
			previous = "k",
			next = "j",
		},
		auto_jump = { "lsp_definitions" },
		use_diagnostic_signs = false,
		indent_lines = true,
		auto_open = false,
		auto_close = false,
		auto_preview = true,
		auto_fold = false,
	}

	trouble.setup(cfg)
end

M.noices = function()
	local present, noices = pcall(require, "noice")

	if not present then
		return
	end

	local cfg = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			opts = {},
			format = {
				cmdline = { pattern = "^:", icon = "📌", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = "🔎 ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = "🔎 ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = "^:%s*lua%s+", icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = {}, -- Used by input()
			},
		},
		messages = {
			enabled = true,
			view = "notify",
			view_error = "notify",
			view_warn = "notify",
			view_history = "messages",
			view_search = "virtualtext",
		},
		popupmenu = {
			enabled = true,
			backend = "nui",
			kind_icons = false,
		},
		redirect = {
			view = "popup",
			filter = { event = "msg_show" },
		},
		commands = {
			history = {
				view = "split",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
			},
			last = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = {
					any = {
						{ event = "notify" },
						{ error = true },
						{ warning = true },
						{ event = "msg_show", kind = { "" } },
						{ event = "lsp", kind = "message" },
					},
				},
				filter_opts = { count = 1 },
			},
			errors = {
				view = "popup",
				opts = { enter = true, format = "details" },
				filter = { error = true },
				filter_opts = { reverse = true },
			},
		},
		notify = {
			enabled = false,
			view = "notify",
		},
		lsp = {
			progress = {
				enabled = true,
				format = {
					{ "{data.progress.percentage}%" },
					{ " {spinner} ", hl_group = "NoiceLspProgressSpinner" },
					{ "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
					{ "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
				},
				format_done = "lsp_progress_done",
				throttle = 900 / 1,
				view = "notify",
			},

			hover = {
				enabled = false,
			},

			message = {
				enabled = true,
				view = "notify",
				opt = {},
			},
			documentation = {
				view = "hover",
				opts = {
					lang = "markdown",
					replace = true,
					render = "plain",
					format = { "{message}" },
					win_options = { concealcursor = "n", conceallevel = 3 },
				},
			},
		},
		markdown = {
			hover = {
				["|(%S-)|"] = vim.cmd.help, -- vim help links
				["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
			},
			highlights = {
				["|%S-|"] = "@text.reference",
				["@%S+"] = "@parameter",
				["^%s*(Parameters:)"] = "@text.title",
				["^%s*(Return:)"] = "@text.title",
				["^%s*(See also:)"] = "@text.title",
				["{%S-}"] = "@parameter",
			},
		},
		health = {
			checker = true, -- Disable if you don't want health checks to run
		},
		smart_move = {
			enabled = true,
			excluded_filetypes = { "cmp_menu", "cmp_docs", "notify", "which-key" },
		},
		throttle = 800 / 2,
	}
	vim.cmd([[ 
		highlight NoiceCmdlinePopupBorder guibg=#1a1b26 guifg=#e60073 gui=nocombine
		highlight NoiceCmdlinePopupBorderSearch guibg=#1a1b26 guifg=#ace600 gui=nocombine
		]])

	noices.setup(cfg)
end

return M
