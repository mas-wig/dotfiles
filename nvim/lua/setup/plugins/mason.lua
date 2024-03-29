return function()
	local ensure_installed = { "stylua", "prettier" }
	require("mason").setup({
		ensure_installed = ensure_installed,
		ui = {
			icons = {
				package_pending = " ",
				package_installed = " ",
				package_uninstalled = "-",
			},
			keymaps = {
				toggle_server_expand = "<CR>",
				install_server = "i",
				update_server = "u",
				check_server_version = "c",
				update_all_servers = "U",
				check_outdated_servers = "C",
				uninstall_server = "X",
				cancel_installation = "<C-c>",
			},
		},
		max_concurrent_installers = 10,
	})
	vim.api.nvim_create_user_command("MasonInstallAll", function()
		vim.cmd("MasonInstall " .. table.concat(ensure_installed, " "))
	end, {})
	vim.g.mason_binaries_list = ensure_installed
end
