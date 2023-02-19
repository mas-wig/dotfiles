local M = {}

local path_sep = "/"
local strip_dir_pat = path_sep .. "([^" .. path_sep .. "]+)$"
local strip_sep_pat = path_sep .. "$"
local dirname = function(pathname)
	if not pathname or #pathname == 0 then
		return
	end
	local result = pathname:gsub(strip_sep_pat, ""):gsub(strip_dir_pat, "")
	if #result == 0 then
		return "/"
	end
	return result
end

M.client = {
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
	gopls = {
		filetypes = { "go", "gomod", "gohtmltmpl", "gotexttmpl" },
		message_level = vim.lsp.protocol.MessageType.Error,
		cmd = {
			"gopls",
			"-remote=auto",
			-- "-logfile=auto",
			-- "-debug=:0",
			"-remote.debug=:0",
			-- "-rpc.trace",
		},

		flags = { allow_incremental_sync = true, debounce_text_changes = 1000 },
		settings = {
			gopls = {
				-- flags = {allow_incremental_sync = true, debounce_text_changes = 500},
				-- not supported
				analyses = { unusedparams = true, unreachable = false },
				codelenses = {
					generate = true, -- show the `go generate` lens.
					gc_details = true,
					test = true,
					tidy = true,
				},
				usePlaceholders = true,
				completeUnimported = true,
				staticcheck = true,
				matcher = "fuzzy",
				diagnosticsDelay = "500ms",
				symbolMatcher = "fuzzy",
				buildFlags = { "-tags", "integration" },
			},
		},
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
		end,
	},

	tsserver = {
		capabilities = M.capabilities,
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		cmd = { "typescript-language-server", "--stdio" },
		init_options = {
			hostInfo = "neovim",
		},
		single_file_support = true,
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
		end,
	},

	phpactor = {
		capabilities = M.capabilities,
		cmd = { "phpactor", "language-server" },
		filetypes = { "php" },
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern(".git")(fname) or dirname(fname)
		end,
		single_file_support = true,
	},

	pyright = {
		on_init = function(client)
			require("navigator.lspclient.python").on_init(client)
		end,
		cmd = { "pyright-langserver", "--stdio" },
		filetypes = { "python" },
		flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
		settings = {
			python = {
				formatting = { provider = "black" },
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
				},
			},
		},
	},

	rust_analyzer = {
		root_dir = function(fname)
			return require("lspconfig").util.root_pattern("Cargo.toml", "rust-project.json", ".git")(fname)
				or dirname(fname)
		end,
		filetypes = { "rust" },
		message_level = vim.lsp.protocol.MessageType.error,
		settings = {
			["rust-analyzer"] = {
				cargo = { loadOutDirsFromCheck = true },
				procMacro = { enable = true },
			},
		},
		flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
	},
}

return M
