local function termcodes(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

return {
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
	nvterm = {
		n = {
			["<A-i>"] = {
				function()
					require("nvterm.terminal").toggle("float")
				end,
				"toggle floating term",
			},
			["<A-h>"] = {
				function()
					require("nvterm.terminal").toggle("horizontal")
				end,
				"toggle horizontal term",
			},
			["<A-v>"] = {
				function()
					require("nvterm.terminal").toggle("vertical")
				end,
				"toggle vertical term",
			},
		},
		t = {
			["<A-i>"] = {
				function()
					require("nvterm.terminal").toggle("float")
				end,
				"toggle floating term",
			},
			["<A-h>"] = {
				function()
					require("nvterm.terminal").toggle("horizontal")
				end,
				"toggle horizontal term",
			},
			["<A-v>"] = {
				function()
					require("nvterm.terminal").toggle("vertical")
				end,
				"toggle vertical term",
			},
			["<C-x>"] = { termcodes("<C-\\><C-N>:q<CR>"), "escape terminal mode" },
		},
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
	overseer = {
		n = {
			["<leader>oC"] = { "<cmd>OverseerClose<cr>", "Overseer Close" },
			["<leader>oa"] = { "<cmd>OverseerTaskAction<cr>", "Overseer Task Action" },
			["<leader>ob"] = { "<cmd>OverseerBuild<cr>", "Overseer Build" },
			["<leader>oc"] = { "<cmd>OverseerRunCmd<cr>", "Overseer Run Cmd" },
			["<leader>od"] = { "<cmd>OverseerDeleteBundle<cr>", "Overseer Delete Bundle" },
			["<leader>ol"] = { "<cmd>OverseerLoadBundle<cr>", "Overseer LoadBundle" },
			["<leader>oo"] = { "<cmd>OverseerOpen!<cr>", "Overseer Open" },
			["<leader>oq"] = { "<cmd>OverseerQuickAction<cr>", "Overseer Quick Action" },
			["<leader>or"] = { "<cmd>OverseerRun<cr>", "Overseer Run" },
			["<leader>os"] = { "<cmd>OverseerSaveBundle<cr>", "Overseer Save Bundle" },
			["<leader>ot"] = { "<cmd>OverseerToggle!<cr>", "Overseer Toggle" },
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
}
