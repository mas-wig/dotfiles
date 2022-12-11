local M = {}
-- language setup --
M.golang = function()
	return {
		adapters = function(callback, _)
			local stdout = vim.loop.new_pipe(false)
			local handle
			local pid_or_err
			local port = 38697
			local opts = {
				stdio = { nil, stdout },
				args = { "dap", "-l", "127.0.0.1:" .. port },
				detached = true,
			}
			handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
				stdout:close()
				handle:close()
				if code ~= 0 then
					print("dlv exited with code", code)
				end
			end)
			assert(handle, "Error running dlv: " .. tostring(pid_or_err))
			stdout:read_start(function(err, chunk)
				assert(not err, err)
				if chunk then
					vim.schedule(function()
						require("dap.repl").append(chunk)
					end)
				end
			end)
			-- Wait for delve to start
			vim.defer_fn(function()
				callback({ type = "server", host = "127.0.0.1", port = port })
			end, 100)
		end,
		configurations = {
			{
				type = "go",
				name = "Debug",
				request = "launch",
				program = "${file}",
			},
			{
				type = "go",
				name = "Debug test", -- configuration for debugging test files
				request = "launch",
				mode = "test",
				program = "${file}",
			},
			-- works with go.mod packages and sub packages
			{
				type = "go",
				name = "Debug test (go.mod)",
				request = "launch",
				mode = "test",
				program = "./${relativeFileDirname}",
			},
		},
	}
end

M.javascript = function()
	local present_a, dap_vscode_js = pcall(require, "dap-vscode-js")
	local present_b, dap = pcall(require, "dap")

	if not (present_a and present_b) then
		return
	end

	local options = {
		node_path = "node",
		debugger_path = "/home/user/.config/debugger/vscode-js-debug",
		adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
	}

	dap_vscode_js.setup(options)

	-- Node
	for _, language in ipairs({ "typescript", "javascript" }) do
		dap.configurations[language] = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
			{
				type = "pwa-node",
				request = "attach",
				name = "Attach",
				processId = require("dap.utils").pick_process,
				cwd = "${workspaceFolder}",
			},
		}
	end
end

-- DAP setup --
M.dapconfig = function()
	local present, dap = pcall(require, "dap")

	if not present then
		return
	end

	local dap_breakpoint = {
		error = {
			text = "🟥",
			texthl = "LspDiagnosticsSignError",
			linehl = "",
			numhl = "",
		},
		rejected = {
			text = "🟩",
			texthl = "LspDiagnosticsSignHint",
			linehl = "",
			numhl = "",
		},
		stopped = {
			text = "🟨",
			texthl = "LspDiagnosticsSignInformation",
			linehl = "DiagnosticUnderlineInfo",
			numhl = "LspDiagnosticsSignInformation",
		},
	}

	vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
	vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
	vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

	local dap_configs = {
		go = M.golang(),
	}

	for dap_name, dap_options in pairs(dap_configs) do
		dap.adapters[dap_name] = dap_options.adapters
		dap.configurations[dap_name] = dap_options.configurations
	end

	vim.api.nvim_create_autocmd("VimLeave", {
		command = "lua require('dap')._vim_exit_handler()",
	})
end

M.dapui = function()
	local present_a, dap = pcall(require, "dap")
	local present_b, dap_ui = pcall(require, "dapui")

	if not (present_a and present_b) then
		return
	end

	local options = {
		icons = { expanded = "🔻", collapsed = "🔺" },
		mappings = {
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			edit = "e",
			repl = "r",
			toggle = "t",
		},
		floating = {
			max_height = nil, -- These can be integers or a float between 0 and 1.
			max_width = nil, -- Floats will be treated as percentage of your screen.
			border = "rounded", -- Border style. Can be "single", "double" or "rounded"
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		layouts = {
			{
				elements = {
					{ id = "watches", size = 0.20 },
					{ id = "stacks", size = 0.20 },
					{ id = "breakpoints", size = 0.20 },
					{ id = "scopes", size = 0.40 },
				},
				size = 64,
				position = "right",
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 0.20,
				position = "bottom",
			},
		},
	}

	dap_ui.setup(options)

	dap.listeners.after.event_initialized["dapui_config"] = function()
		dap_ui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dap_ui.close()
		dap.repl.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dap_ui.close()
		dap.repl.close()
	end
end

M.dap_virtual_text = function()
	local present, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")

	if not present then
		return
	end

	dap_virtual_text.setup()
end

return M
