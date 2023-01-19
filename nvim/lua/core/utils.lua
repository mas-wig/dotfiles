local M = {}

M.load_plugins = function()
	local ensure_packer = function()
		local fn = vim.fn
		local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
			vim.cmd([[packadd packer.nvim]])
			return true
		end
		return false
	end

	local packer_bootstrap = ensure_packer()
	local plugins = require("plugins.plugins")

	require("packer").init({
		profile = {
			enable = true,
			threshold = 0,
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	})

	require("packer").startup({ plugins })

	if packer_bootstrap then
		require("packer").sync()
		vim.api.nvim_create_autocmd("User", {
			pattern = "PackerComplete",
			callback = function()
				vim.cmd("bw | silent! MasonInstallAll")
				require("packer").loader("nvim-treesitter")
			end,
		})
	end
end

M.load_autocmd = function()
	return pcall(require, "core.autocmd")
end

-- LAZY LOAD --
M.lazy_load = function(tb)
	vim.api.nvim_create_autocmd(tb.events, {
		group = vim.api.nvim_create_augroup(tb.augroup_name, {}),
		callback = function()
			if tb.condition() then
				vim.api.nvim_del_augroup_by_name(tb.augroup_name)
				if tb.plugin ~= "nvim-treesitter" then
					vim.defer_fn(function()
						require("packer").loader(tb.plugin)
						if tb.plugin == "nvim-lspconfig" then
							vim.cmd("silent! do FileType")
						end
					end, 0)
				else
					require("packer").loader(tb.plugin)
				end
			end
		end,
	})
end

M.on_file_open = function(plugin_name)
	M.lazy_load({
		events = { "BufRead", "BufWinEnter", "BufNewFile" },
		augroup_name = "BeLazyOnFileOpen" .. plugin_name,
		plugin = plugin_name,
		condition = function()
			local file = vim.fn.expand("%")
			return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
		end,
	})
end

M.gitsigns = function()
	vim.api.nvim_create_autocmd({ "BufRead" }, {
		group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
		callback = function()
			vim.fn.system("git -C " .. vim.fn.expand("%:p:h") .. " rev-parse")
			if vim.v.shell_error == 0 then
				vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
				vim.schedule(function()
					require("packer").loader("gitsigns.nvim")
				end)
			end
		end,
	})
end

-- END --

M.setup = function()
	M.load_plugins()
	M.load_autocmd()
end

return M
