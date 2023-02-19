local M = {}

M.add_lazy = function()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end
	vim.opt.rtp:prepend(lazypath)
end

M.add_plugins = function()
	M.add_lazy()
	local options = {
		defaults = {
			lazy = false,
			version = "*",
		},
		spec = { { import = "plugins" } },
		install = {
			missing = true,
			colorscheme = { "tokyonight" },
		},
		change_detection = {
			enabled = true,
			notify = true,
		},
		ui = {
			icons = {
				cmd = "⌘",
				config = "🛠",
				event = "📅",
				ft = "📂",
				init = "⚙",
				keys = "🗝",
				plugin = "🔌",
				runtime = "💻",
				source = "📄",
				start = "🚀",
				task = "📌",
				lazy = "💤 ",
			},
		},
		performance = {
			cache = {
				enabled = true,
			},
			reset_packpath = true,
			rtp = {
				reset = true,
				disabled_plugins = {
					"2html_plugin",
					"getscript",
					"getscriptPlugin",
					"gzip",
					"logipat",
					"netrw",
					"netrwPlugin",
					"netrwSettings",
					"netrwFileHandlers",
					"matchit",
					"tar",
					"tarPlugin",
					"rrhelper",
					"spellfile_plugin",
					"vimball",
					"vimballPlugin",
					"zip",
					"zipPlugin",
					"tutor",
					"rplugin",
					"syntax",
					"synmenu",
					"optwin",
					"compiler",
					"bugreport",
					"ftplugin",
				},
			},
		},
	}
	require("lazy").setup(options)
end

M.setup = function()
	require("setup.options")
	M.add_plugins()
	require("setup.mappings")
	require("setup.autocmds")
end

return M
