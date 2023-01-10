local M = {}

M.local_plugins = {}

function M.get_name(pkg)
	local parts = vim.split(pkg, "/")
	return parts[#parts], parts[1]
end

function M.has_local(name)
	return vim.loop.fs_stat(vim.fn.expand("~/projects/" .. name)) ~= nil
end

-- Replace semua plugins dengan local clone ke ~/projects folder
function M.process_local_plugins(spec)
	if type(spec) == "string" then
		local name, owner = M.get_name(spec)
		local local_pkg = "~/projects/" .. name

		if M.local_plugins[name] or M.local_plugins[owner] or M.local_plugins[owner .. "/" .. name] then
			if M.has_local(name) then
				return local_pkg
			else
				error("Local package " .. name .. " not found")
			end
		end
		return spec
	else
		for i, s in ipairs(spec) do
			spec[i] = M.process_local_plugins(s)
		end
	end
	if spec.requires then
		spec.requires = M.process_local_plugins(spec.requires)
	end
	return spec
end

function M.wrap(use)
	return function(spec)
		spec = M.process_local_plugins(spec)
		use(spec)
	end
end

function M.bootstrap()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd("packadd packer.nvim")
	end
	vim.cmd([[packadd packer.nvim]])
end

function M.setup(config, set)
    M.bootstrap()
	local packer = require("packer")
	packer.init(config)
	M.local_plugins = config.local_plugins or {}
	packer.startup({
		function(use)
			use = M.wrap(use)
			set(use)
		end,
	})
end

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

return M
