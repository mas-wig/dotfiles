local present_a, formatter = pcall(require, "formatter")
local present_b, util = pcall(require, "formatter.util")

if not (present_a and present_b) then
	return
end

local options = {
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		["lua"] = {
			function()
				return {
					exe = "stylua",
					args = {
						"--search-parent-directories",
						"--stdin-filepath",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
						"-",
					},
					stdin = true,
				}
			end,
		},
		-- ["go"] = {
		-- 	function()
		-- 		return {
		-- 			exe = "gofmt",
		-- 			args = {},
		-- 			stdin = true,
		-- 		}
		-- 	end,
		-- },

		["javascript"] = {
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},

		["json"] = {
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},

		["html"] = {
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},

		["css"] = {
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},

		["javascriptreact"] = {
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},

		["typescriptreact"] = {
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},

		["typescript"] = {
			function()
				return {
					exe = "prettierd",
					args = { util.escape_path(util.get_current_buffer_file_path()) },
					stdin = true,
				}
			end,
		},

		["rust"] = {
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},

		["cpp"] = {
			function()
				return {
					exe = "clang-format",
					args = {},
					stdin = true,
				}
			end,
		},

		["java"] = {
			function()
				return {
					exe = "clang-format",
					args = {},
					stdin = true,
				}
			end,
		},
		["c"] = {
			function()
				return {
					exe = "clang-format",
					args = {},
					stdin = true,
				}
			end,
		},

		["python"] = {
			function()
				return {
					exe = "autopep8",
					args = { "-" },
					stdin = true,
				}
			end,
		},
	},
}

formatter.setup(options)
