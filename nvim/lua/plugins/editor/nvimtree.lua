local M = {}

M.setup = function()
	local present, nvimtree = pcall(require, "nvim-tree")

	if not present then
		return
	end

	nvimtree.setup({
		auto_reload_on_write = true,
		ignore_buffer_on_setup = false,
		sort_by = "name",
		prefer_startup_root = false,
		sync_root_with_cwd = true,
		reload_on_bufenter = true,
		respect_buf_cwd = false,
		on_attach = "disable",
		view = {
			centralize_selection = false,
			cursorline = true,
			debounce_delay = 15,
			width = 30,
			hide_root_folder = true,
			side = "left",
			preserve_window_proportions = false,
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			float = {
				enable = false,
				quit_on_focus_loss = true,
				open_win_config = {
					relative = "editor",
					border = "rounded",
					width = 30,
					height = 30,
					row = 1,
					col = 1,
				},
			},
		},
		renderer = {
			highlight_git = true,
			full_name = false,
			highlight_opened_files = "none",
			highlight_modified = "name",
			root_folder_label = ":~:s?$?/..?",
			indent_width = 3,
			indent_markers = {
				enable = true,
				inline_arrows = true,
				icons = {
					corner = "└",
					edge = "│",
					item = "│",
					bottom = "─",
					none = " ",
				},
			},
			icons = {
				webdev_colors = true,
				git_placement = "before",
				modified_placement = "after",
				padding = " ",
				symlink_arrow = " ➛ ",
				show = {
					file = true,
					folder = true,
					folder_arrow = true,
					git = true,
					modified = true,
				},
				glyphs = {
					default = "📜",
					symlink = "",
					bookmark = "",
					modified = "●",
					folder = {
						default = "📁",
						empty = "📁",
						empty_open = "📂",
						open = "📂",
						symlink = "",
						symlink_open = "",
						arrow_open = "",
						arrow_closed = "",
					},
					git = {
						unstaged = "✗",
						staged = "✓",
						unmerged = "",
						renamed = "➜",
						untracked = "★",
						deleted = "",
						ignored = "◌",
					},
				},
			},
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
			symlink_destination = true,
		},
		diagnostics = {
			enable = false,
			show_on_dirs = false,
			show_on_open_dirs = true,
			debounce_delay = 50,
			severity = {
				min = vim.diagnostic.severity.HINT,
				max = vim.diagnostic.severity.ERROR,
			},
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		filters = {
			dotfiles = false,
			git_clean = false,
			no_buffer = false,
			custom = {},
			exclude = {},
		},
		filesystem_watchers = {
			enable = true,
			debounce_delay = 50,
			ignore_dirs = {},
		},
		git = {
			enable = true,
			ignore = true,
			show_on_dirs = true,
			show_on_open_dirs = true,
			timeout = 400,
		},
		modified = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = true,
		},
		actions = {
			use_system_clipboard = true,
			change_dir = {
				enable = true,
				global = false,
				restrict_above_cwd = false,
			},
			file_popup = {
				open_win_config = {
					col = 1,
					row = 1,
					relative = "cursor",
					border = "shadow",
					style = "minimal",
				},
			},
			open_file = {
				quit_on_open = false,
				resize_window = true,
				window_picker = {
					enable = true,
					picker = "default",
					chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
					exclude = {
						filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", "lazy" },
						buftype = { "nofile", "terminal", "help" },
					},
				},
			},
			remove_file = {
				close_window = true,
			},
		},
		trash = {
			cmd = "gio trash",
		},
		live_filter = {
			prefix = "[FILTER]: ",
			always_show_folders = true,
		},
		notify = {
			threshold = vim.log.levels.INFO,
		},
		ui = {
			confirm = {
				remove = true,
				trash = true,
			},
		},
	})
end

M.keymaps = {
	{ "<C-n>", "<cmd>NvimTreeToggle<cr>", desc = "Open NvimTree" },
	{ "<A-p>", "<cmd>NvimTreeFocus<cr>", desc = "Focus NvimTree" },
	{ "<A-f>", "<cmd>NvimTreeFindFile<cr>", desc = "Find File NvimTree" },
}

M.cmd = {
	"NvimTreeOpen",
	"NvimTreeClose",
	"NvimTreeToggle",
	"NvimTreeFocus",
	"NvimTreeRefresh",
	"NvimTreeFindFile",
	"NvimTreeFindFileToggle",
	"NvimTreeClipboard",
	"NvimTreeResize",
	"NvimTreeCollapse",
	"NvimTreeCollapseKeepBuffers",
}

return M
