return {
	general = {
		n = {
			["<C-s>"] = { "<cmd>:w<CR>", "Save File" },
		},
		i = {
			["<C-s>"] = { "<cmd>:w<CR>", "Save File" },
		},
	},
	telescope = {
		n = {
			["<leader>ff"] = { "<cmd>Telescope find_files<CR>", "find files" },
			["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
			["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "live grep" },
			["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
			["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "help page" },
			["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
			["<leader>fc"] = { "<cmd> Telescope colorscheme <CR>", "colorscheme" },
			["<leader>fm"] = {
				function()
					require("telescope").extensions.media_files.media_files()
				end,
				"media files",
			},
		},
	},
	gitsigns = {
		n = {
			["<leader>hs"] = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
			["<leader>hr"] = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
			["<leader>hS"] = { "<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer" },
			["<leader>hu"] = { "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
			["<leader>hR"] = { "<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
			["<leader>hp"] = { "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
			["<leader>hb"] = {
				function()
					require("gitsigns").blame_line({ full = true })
				end,
				"Blame Line",
			},
			["<leader>tb"] = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Current Line Blame" },
			["<leader>hd"] = { "<cmd>Gitsigns diffthis<CR>", "Diffthis" },
			["<leader>hD"] = {
				function()
					require("gitsigns").diffthis("~")
				end,
				"Difthis ~",
			},
			["<leader>td"] = { "<cmd>Gitsigns toggle_deleted<CR>", "Toogle Deleted" },
			["]c"] = { "<cmd>Gitsigns next_hunk<CR>", "Next Hunk" },
			["[c"] = { "<cmd>Gitsigns prev_hunk<CR>", "Prev Hunk" },
		},
		v = {
			["<leader>hs"] = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
			["<leader>hr"] = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
		},
	},

	toggleterm = {
		n = {
			["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", "Open Float Term" },
			["<A-v>"] = { "<cmd>ToggleTerm direction=vertical<cr>", "Open Vert Term" },
			["<A-h>"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "Open Horz Term" },
		},
		t = {
			["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", "Open Float Term" },
			["<A-v>"] = { "<cmd>ToggleTerm direction=vertical<cr>", "Open Vert Term" },
			["<A-h>"] = { "<cmd>ToggleTerm direction=horizontal<cr>", "Open Horz Term" },
		},
	},

	nvimtree = {
		n = {
			["<C-n>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
			["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
		},
	},
	bufferline = {
		n = {
			["<TAB>"] = { "<cmd> BufferLineCycleNext <CR>", "Buffer Next" },
			["<S-Tab>"] = { "<cmd> BufferLineCyclePrev <CR>", "Buffer Prev" },
			["<leader>bc"] = { "<cmd>:bd<CR>", "Close Buffer" },
		},
	},
	restNvim = {
		n = { ["<leader>br"] = { "<Plug>RestNvim<CR>", "Rest Testing" } },
	},
	code_runner = {
		n = {
			["<leader>rc"] = { "<cmd>RunCode<CR>", "Run Code" },
			["<leader>rf"] = { "<cmd>RunFile<CR>", "Run File" },
			["<leader>rft"] = { "<cmd>RunFile tab<CR>", "Run File tab" },
			["<leader>rp"] = { "<cmd>RunProject<CR>", "Run Project" },
			["<leader>rq"] = { "<cmd>RunClose<CR>", "Run CLose" },
			["<leader>crf"] = { "<cmd>CRFiletype<CR>", "CR Filetype" },
			["<leader>crp"] = { "<cmd>CRProjects<CR>", "CR Project" },
		},
	},
	comment = {
		n = {
			["<leader>gc"] = {
				function()
					require("Comment.api").toggle.linewise.current()
				end,
				"toggle comment",
			},
		},
		v = {
			["<leader>gc"] = {
				"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
				"toggle comment",
			},
		},
	},
	dap = {
		n = {
			["<leader>dR"] = {
				function()
					require("dap").run_to_cursor()
				end,
				"Run to Cursor",
			},
			["<leader>dE"] = {
				function()
					require("dapui").eval(vim.fn.input("[Expression] > "))
				end,
				"Evaluate Input",
			},
			["<leader>dC"] = {
				function()
					require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
				end,
				"Conditional Breakpoint",
			},
			["<leader>dU"] = {
				function()
					require("dapui").toggle()
				end,
				"Toggle UI",
			},
			["<leader>db"] = {
				function()
					require("dap").step_back()
				end,
				"Step Back",
			},
			["<leader>dc"] = {
				function()
					require("dap").continue()
				end,
				"Continue",
			},
			["<leader>dd"] = {
				function()
					require("dap").disconnect()
				end,
				"Disconnect",
			},
			["<leader>de"] = {
				function()
					require("dapui").eval()
				end,
				"Evaluate",
			},
			["<leader>dg"] = {
				function()
					require("dap").session()
				end,
				"Get Session",
			},

			-- Floating dap windows --
			["<leader>dft"] = {
				function()
					require("dapui").float_element("scopes", { width = 100, height = 20, enter = true })
				end,
				"Scope Float",
			},
			["<leader>dfr"] = {
				function()
					require("dapui").float_element("repl", { width = 100, height = 20, enter = true })
				end,
				"Repl Float",
			},
			["<leader>dfc"] = {
				function()
					require("dapui").float_element("console", { width = 100, height = 20, enter = true })
				end,
				"Console Float",
			},
			["<leader>dfb"] = {
				function()
					require("dapui").float_element("breakpoints", { width = 100, height = 20, enter = true })
				end,
				"Breakpoint Float",
			},
			["<leader>dfs"] = {
				function()
					require("dapui").float_element("stacks", { width = 100, height = 20, enter = true })
				end,
				"Stacks Float",
			},
			["<leader>dfw"] = {
				function()
					require("dapui").float_element("watches", { width = 100, height = 20, enter = true })
				end,
				"Watches Float",
			},
			-- End --

			["<leader>dh"] = {
				function()
					require("dap.ui.widgets").hover()
				end,
				"Hover Variables",
			},
			["<leader>dS"] = {
				function()
					require("dap.ui.widgets").scopes()
				end,
				"Scopes",
			},
			["<leader>di"] = {
				function()
					require("dap").step_into()
				end,
				"Step Into",
			},
			["<leader>do"] = {
				function()
					require("dap").step_over()
				end,
				"Step Over",
			},
			["<leader>dp"] = {
				function()
					require("dap").pause.toggle()
				end,
				"Pause",
			},
			["<leader>dq"] = {
				function()
					require("dap").close()
				end,
				"Quit",
			},
			["<leader>dr"] = {
				function()
					require("dap").repl.toggle()
				end,
				"Toggle Repl",
			},
			["<leader>ds"] = {
				function()
					require("dap").continue()
				end,
				"Start",
			},
			["<leader>dt"] = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
			["<leader>dx"] = {
				function()
					require("dap").terminate()
				end,
				"Terminate",
			},
			["<leader>du"] = {
				function()
					require("dap").step_out()
				end,
				"Step Out",
			},
		},
		v = {
			["<leader>e"] = {
				function()
					require("dapui").eval()
				end,
				"Evaluate",
			},
		},
	},
	neotest = {
		n = {
			["<leader>ta"] = {
				function()
					require("neotest").run.attach()
				end,
				"Attach",
			},
			["<leader>tf"] = {
				function()
					require("neotest").run.run(vim.fn.expand("%"))
				end,
				"Run File",
			},
			["<leader>tF"] = {
				function()
					require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
				end,
				"Debug File",
			},
			["<leader>tl"] = {
				function()
					require("neotest").run.run_last()
				end,
				"Run Last",
			},
			["<leader>tL"] = {
				function()
					require("neotest").run.run_last({ strategy = "dap" })
				end,
				"Debug Last",
			},
			["<leader>tn"] = {
				function()
					require("neotest").run.run()
				end,
				"Run Nearest",
			},
			["<leader>tN"] = {
				function()
					require("neotest").run.run({ strategy = "dap" })
				end,
				"Debug Nearest",
			},
			["<leader>to"] = {
				function()
					require("neotest").output.open({ enter = true, short = true })
				end,
				"Output",
			},
			["<leader>tS"] = {
				function()
					require("neotest").run.stop()
				end,
				"Stop",
			},
			["<leader>ts"] = {
				function()
					require("neotest").summary.toggle()
				end,
				"Summary",
			},

			["<leader>tp"] = { "<Plug>PlenaryTestFile<cr>", "Plenary TestFile" },
			["<leader>tv"] = { "<cmd>TestVisit<cr>", "Visit" },
			["<leader>tx"] = { "<cmd>TestSuite<cr>", "Suite" },
		},
	},
	trouble = {
		n = {
			["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
			["<leader>xw"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Touble workspace" },
			["<leader>xd"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Touble document" },
			["<leader>xq"] = { "<cmd>TroubleToggle quickfix<cr>", "Trouble qf" },
			["<leader>xl"] = { "<cmd>TroubleToggle loclist<cr>", "Trouble loclist" },
		},
	},
	Hop = {
		n = {
			["F"] = { "<cmd>HopWord<cr>", "HopWord" },
		},
	},
	navigator = {
		n = {
			["K"] = {
				function()
					vim.lsp.buf.hover()
				end,
				"Hover Docs",
			},
			["gr"] = {
				function()
					require("navigator.reference").async_ref()
				end,
				"Async Reference",
			},
			["<leader>gr"] = {
				function()
					require("navigator.reference").reference()
				end,
				"Reference",
			},
			["g0"] = {
				function()
					require("navigator.symbols").document_symbols()
				end,
				"Document Symbols",
			},
			["gW"] = {
				function()
					require("navigator.workspace").workspace_symbol_live()
				end,
				"Workspace symbol live",
			},
			-- ["<c-]>"] = {
			-- 	function()
			-- 		require("navigator.definition").definition()
			-- 	end,
			-- 	"Definition",
			-- },
			["gd"] = {
				function()
					require("navigator.definition").definition()
				end,
				"Definition",
			},
			["gD"] = {
				function()
					vim.lsp.buf.declaration()
				end,
				"declaration",
			},
			["gp"] = {
				function()
					require("navigator.definition").definition_preview()
				end,
				"Definition Preview",
			},
			["<leader>gt"] = {
				function()
					require("navigator.treesitter").buf_ts()
				end,
				"Buffer ts",
			},
			["<leader>gT"] = {
				function()
					require("navigator.treesitter").bufs_ts()
				end,
				"Buffers ts",
			},
			["<leader>ct"] = {
				function()
					require("navigator.ctags").ctags()
				end,
				"ctags",
			},
			["<leader>ca"] = {
				function()
					require("navigator.codeAction").code_action()
				end,
				"Code Action",
			},
			["<Space>rn"] = {
				function()
					require("navigator.rename").rename()
				end,
				"rename",
			},
			["<Leader>gi"] = {
				function()
					vim.lsp.buf.incoming_calls()
				end,
				"incoming_calls",
			},
			["<Leader>go"] = {
				function()
					vim.lsp.buf.outgoing_calls()
				end,
				"outgoing_calls",
			},
			["gi"] = {
				function()
					vim.lsp.buf.implementation()
				end,
				"implementation",
			},
			["<leader>D"] = {
				function()
					vim.lsp.buf.type_definition()
				end,
				"type_definition",
			},
			["gL"] = {
				function()
					require("navigator.diagnostics").show_diagnostics()
				end,
				"show_diagnostics",
			},
			["gG"] = {
				function()
					require("navigator.diagnostics").show_buf_diagnostics()
				end,
				"show_buf_diagnostics",
			},
			["<Leader>dt"] = {
				function()
					require("navigator.diagnostics").toggle_diagnostics()
				end,
				"toggle_diagnostics",
			},
			["]d"] = {
				function()
					vim.diagnostic.goto_next()
				end,
				"next diagnostics",
			},
			["[d"] = {
				function()
					vim.diagnostic.goto_prev()
				end,
				"prev diagnostics",
			},
			["]O"] = {
				function()
					vim.diagnostic.set_loclist()
				end,
				"diagnostics set loclist",
			},
			["]r"] = {
				function()
					require("navigator.treesitter").goto_next_usage()
				end,
				"goto_next_usage",
			},
			["[r"] = {
				function()
					require("navigator.treesitter").goto_previous_usage()
				end,
				"goto_previous_usage",
			},
			["<C-LeftMouse>"] = {
				function()
					vim.lsp.buf.definition()
				end,
				"definition",
			},
			["g<LeftMouse>"] = {
				function()
					vim.lsp.buf.implementation()
				end,
				"implementation",
			},
			["<Leader>k"] = {
				function()
					require("navigator.dochighlight").hi_symbol()
				end,
				"hi_symbol",
			},
			["<leader>wa"] = {
				function()
					require("navigator.workleader").add_workleader_folder()
				end,
				"add_workleader_folder",
			},
			["<Space>wl"] = {
				function()
					require("navigator.workspace").list_workspace_folders()
				end,
				"list_workspace_folders",
			},
			["<Space>la"] = {
				function()
					require("navigator.codelens").run_action()
				end,
				"run code lens action",
			},
		},
		i = {
			["<C-k>"] = {
				function()
					vim.lsp.buf.signature_help()
				end,
				"Signature Help",
			},
		},
		v = {
			["<leader>ca"] = {
				function()
					require("navigator.codeAction").range_code_action()
				end,
				"Range Code Actions",
			},
		},
	},
}
