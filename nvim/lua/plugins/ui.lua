return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		event = "VimEnter",
		config = function()
			require("plugins.ui.tokyonight")
			vim.cmd("colorscheme tokyonight")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		dependencies = { "tiagovla/scope.nvim", lazy = true },
		lazy = true,
		event = "VimEnter",
		config = function()
			require("plugins.ui.bufferline")
		end,
	},

	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("plugins.ui.alpha").setup()
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		lazy = true,
		keys = require("plugins.ui.noice").keymaps,
		config = function()
			require("plugins.ui.noice").setup()
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("plugins.ui.lualine").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		init = function()
			local Util = require("setup.utils")
			if not Util.has("noice.nvim") then
				Util.on_very_lazy(function()
					vim.notify = require("notify")
				end)
			end
		end,
	},

	{
		"stevearc/dressing.nvim",
		lazy = true,
		init = function()
			vim.ui.select = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.select(...)
			end
			vim.ui.input = function(...)
				require("lazy").load({ plugins = { "dressing.nvim" } })
				return vim.ui.input(...)
			end
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("indent_blankline").setup({
				char = "│",
				filetype_exclude = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "dbui" },
				show_trailing_blankline_indent = false,
				show_current_context = false,
				show_current_context_start = false,
			})
		end,
	},

	{
		"echasnovski/mini.indentscope",
		version = false, -- wait till new 0.7.0 release to put it back on semver
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "help", "alpha", "dashboard", "NvimTree", "Trouble", "lazy", "mason", "dbui" },
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})
			require("mini.indentscope").setup(opts)
		end,
	},
}
