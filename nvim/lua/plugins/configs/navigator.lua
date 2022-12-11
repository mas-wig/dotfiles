local present_b, navigator = pcall(require, "navigator")
local present_a, navic = pcall(require, "nvim-navic")

if not (present_a and present_b) then
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
	keymaps = {
		{ key = "<A-f>", func = vim.lsp.buf.format, mode = "n", desc = "format" },
		{ key = "<A-f>", func = vim.lsp.buf.range_formatting, mode = "v", desc = "range format" },
		{
			key = "<Leader>dm",
			func = require("navigator.diagnostics").toggle_diagnostics,
			desc = "Nv Toggle Diagnostics",
		},
	},
	ts_fold = false,
	on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
	end,

	lsp = {
		enable = true,
		format_on_save = false,
		diagnostic_update_in_insert = true,
		disply_diagnostic_qf = false,
		lsp_signature_help = true,
		code_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
		code_lens_action = { enable = true, sign = true, sign_priority = 40, virtual_text = true },
		document_highlight = true,
		disable_lsp = {},
		intelephense = {
			capabilities = M.capabilities,
			single_file_support = true,
		},
		sqls = {
			capabilities = M.capabilities,
			single_file_support = true,
		},
		sumneko_lua = {
			capabilities = M.capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
						},
						maxPreload = 100000,
						preloadFileSize = 10000,
					},
				},
			},
		},
		cssls = {
			capabilities = M.capabilities,
			cmd = { "vscode-css-language-server", "--stdio" },
			single_file_support = true,
		},
		html = {
			capabilities = M.capabilities,
			cmd = { "vscode-html-language-server", "--stdio" },
			single_file_support = true,
		},
		tsserver = { capabilities = M.capabilities, single_file_support = true },
		rust_analyzer = { capabilities = M.capabilities, single_file_support = true },
		clangd = { capabilities = M.capabilities, single_file_support = true },
		pyright = { capabilities = M.capabilities, single_file_support = true },
	},
}

navigator.setup(opt)

return M
