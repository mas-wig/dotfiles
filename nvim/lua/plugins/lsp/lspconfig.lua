local M = {}

M.opts = {
	diagnostics = {
		underline = true,
		update_in_insert = true,
		-- virtual_text = {spacing = 4, prefix = "●"},
		severity_sort = true,
	},
	servers = require("plugins.lsp.client").client,
	setup = {},
}

M.setup = function(_, opts)
	opts = M.opts

	require("setup.utils").on_attach(function(client, _)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end)

	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	vim.diagnostic.config(opts.diagnostics)

	local servers = opts.servers

	local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

	local function setup(server)
		local server_opts = vim.tbl_deep_extend("force", {
			capabilities = vim.deepcopy(capabilities),
		}, servers[server] or {})
		if opts.setup[server] then
			if opts.setup[server](server, server_opts) then
				return
			end
		elseif opts.setup["*"] then
			if opts.setup["*"](server, server_opts) then
				return
			end
		end
		require("lspconfig")[server].setup(server_opts)
	end

	local mlsp = require("mason-lspconfig")
	local available = mlsp.get_available_servers()

	local ensure_installed = {}
	for server, server_opts in pairs(servers) do
		if server_opts then
			server_opts = server_opts == true and {} or server_opts
			if server_opts.mason == false or not vim.tbl_contains(available, server) then
				setup(server)
			else
				ensure_installed[#ensure_installed + 1] = server
			end
		end
	end

	require("mason-lspconfig").setup({ ensure_installed = ensure_installed, automatic_installation = true })

	require("mason-lspconfig").setup_handlers({ setup })
end

return M
