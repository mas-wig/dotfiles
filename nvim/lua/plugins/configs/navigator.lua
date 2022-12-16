local present, navigator = pcall(require, "navigator")

if not present then
	return
end

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local opt = {
	mason = true,
	border = "rounded",--[[  { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, ]]
	default_mapping = false,
	ts_fold = false,
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			require("nvim-navic").attach(client, bufnr)
		end
	end,

	lsp = {
		enable = true,
		format_on_save = false,
		diagnostic_update_in_insert = true,
		disply_diagnostic_qf = false,
		lsp_signature_help = nil,
		signature_help_cfg = nil,
		code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
		code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
		document_highlight = true,
		disable_lsp = {
			"angularls",
			"flow",
			"bashls",
			"dockerls",
			"julials",
			"pylsp",
			"jedi_language_server",
			"jdtls",
			"vimls",
			"solargraph",
			"yamlls",
			"ccls",
			"denols",
			"graphql",
			"dotls",
			"kotlin_language_server",
			"nimls",
			"vuels",
			"phpactor",
			"omnisharp",
			"r_language_server",
			"terraformls",
			"svelte",
			"texlab",
			"clojure_lsp",
			"elixirls",
			"sourcekit",
			"fsautocomplete",
			"vls",
			"hls",
		},
		intelephense = { capabilities = M.capabilities, single_file_support = true },
		sumneko_lua = { capabilities = M.capabilities, single_file_support = true },
		cssls = { capabilities = M.capabilities, single_file_support = true },
		html = { capabilities = M.capabilities, single_file_support = true },
		tsserver = { capabilities = M.capabilities, single_file_support = true },
		rust_analyzer = { capabilities = M.capabilities, single_file_support = true },
		clangd = { capabilities = M.capabilities, single_file_support = true },
		pyright = { capabilities = M.capabilities, single_file_support = true },
	},
}

navigator.setup(opt)

return M
