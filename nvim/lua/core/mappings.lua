return {
	general = {
		{ "n", "<C-s>", "<cmd>:w<CR>", "Save File" },
		{ "i", "<C-s>", "<cmd>:w<CR>", "Save File" },
	},
	telescope = {

		{ "n", "<leader>ff", "<cmd>Telescope find_files<CR>", "find files" },
		{ "n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "find all" },
		{ "n", "<leader>fw", "<cmd> Telescope live_grep <CR>", "live grep" },
		{ "n", "<leader>fb", "<cmd> Telescope buffers <CR>", "find buffers" },
		{ "n", "<leader>fh", "<cmd> Telescope help_tags <CR>", "help page" },
		{ "n", "<leader>fo", "<cmd> Telescope oldfiles <CR>", "find oldfiles" },
		{ "n", "<leader>fc", "<cmd> Telescope colorscheme <CR>", "colorscheme" },
		{ "n", "<leader>fm", "lua require('telescope').extensions.media_files.media_files()", "media files" },
	},
	gitsigns = {
		{ "n", "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
		{ "n", "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
		{ "n", "<leader>hS", "<cmd>Gitsigns stage_buffer<CR>", "Stage Buffer" },
		{ "n", "<leader>hu", "<cmd>Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk" },
		{ "n", "<leader>hR", "<cmd>Gitsigns reset_buffer<CR>", "Reset Buffer" },
		{ "n", "<leader>hp", "<cmd>Gitsigns preview_hunk<CR>", "Preview Hunk" },
		{
			"n",
			"<leader>hb",
			"lua require('gitsigns').blame_line({ full = true })",
			"Blame Line",
		},
		{ "n", "<leader>tb", "<cmd>Gitsigns toggle_current_line_blame<CR>", "Toggle Current Line Blame" },
		{ "n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>", "Diffthis" },
		{ "n", "<leader>hD", "lua require('gitsigns').diffthis(' ~ ')", "Difthis ~" },
		{ "n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>", "Toogle Deleted" },
		{ "n", "]c", "<cmd>Gitsigns next_hunk<CR>", "Next Hunk" },
		{ "n", "[c", "<cmd>Gitsigns prev_hunk<CR>", "Prev Hunk" },
		{ "v", "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
		{ "v", "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
	},

	toggleterm = {

		{ "n", "<A-i>", "<cmd>ToggleTerm direction=float<cr>", "Open Float Term" },
		{ "n", "<A-v>", "<cmd>ToggleTerm direction=vertical<cr>", "Open Vert Term" },
		{ "n", "<A-h>", "<cmd>ToggleTerm direction=horizontal<cr>", "Open Horz Term" },

		{ "t", "<A-i>", "<cmd>ToggleTerm direction=float<cr>", "Open Float Term" },
		{ "t", "<A-v>", "<cmd>ToggleTerm direction=vertical<cr>", "Open Vert Term" },
		{ "t", "<A-h>", "<cmd>ToggleTerm direction=horizontal<cr>", "Open Horz Term" },
	},

	nvimtree = {

		{ "n", "<C-n>", "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
		{ "n", "<leader>e", "<cmd> NvimTreeFocus <CR>", "focus nvimtree" },
	},
	bufferline = {

		{ "n", "<TAB>", "<cmd> BufferLineCycleNext <CR>", "Buffer Next" },
		{ "n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>", "Buffer Prev" },
		{ "n", "<leader>bc", "<cmd>:bd<CR>", "Close Buffer" },
	},
	restNvim = {
		{ "n", "<leader>br", "<Plug>RestNvim<CR>", "Rest Testing" },
	},
	code_runner = {

		{ "n", "<leader>rc", "<cmd>RunCode<CR>", "Run Code" },
		{ "n", "<leader>rf", "<cmd>RunFile<CR>", "Run File" },
		{ "n", "<leader>rft", "<cmd>RunFile tab<CR>", "Run File tab" },
		{ "n", "<leader>rp", "<cmd>RunProject<CR>", "Run Project" },
		{ "n", "<leader>rq", "<cmd>RunClose<CR>", "Run CLose" },
		{ "n", "<leader>crf", "<cmd>CRFiletype<CR>", "CR Filetype" },
		{ "n", "<leader>crp", "<cmd>CRProjects<CR>", "CR Project" },
	},
	comment = {
		{
			"n",
			"<leader>gc",
			"lua require('Comment.api').toggle.linewise.current()",
			"toggle comment",
		},
		{
			"v",
			"<leader>gc",
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
	},
	dap = {

		{ "n", "<leader>dR", "lua require('dap').run_to_cursor()", "Run to Cursor" },
		{
			"n",
			"<leader>dE",
			"lua require('dapui').eval(vim.fn.input('[Expression] > '))",
			"Evaluate Input",
		},
		{
			"n",
			"<leader>dC",
			"lua require('dap').set_breakpoint(vim.fn.input('[Condition] > '))",
			"Conditional Breakpoint",
		},
		{ "n", "<leader>dU", "lua require('dapui').toggle()", "Toggle UI" },
		{ "n", "<leader>db", "lua require('dap').step_back()", "Step Back" },
		{ "n", "<leader>dc", "lua require('dap').continue()", "Continue" },
		{ "n", "<leader>dd", "lua require('dap').disconnect()", "Disconnect" },
		{ "n", "<leader>de", "lua require('dapui').eval()", "Evaluate" },
		{ "n", "<leader>dg", "lua require('dap').session()", "Get Session" },

		-- Floating dap windows --
		{
			"n",
			"<leader>dft",
			"lua require('dapui').float_element('scopes', { width = 100, height = 20, enter = true })",
			"Scope Float",
		},
		{
			"n",
			"<leader>dfr",
			"lua require('dapui').float_element('repl', { width = 100, height = 20, enter = true })",
			"Repl Float",
		},
		{
			"n",
			"<leader>dfc",
			"lua require('dapui').float_element('console', { width = 100, height = 20, enter = true })",
			"Console Float",
		},
		{
			"n",
			"<leader>dfb",
			"lua require('dapui').float_element('breakpoints', { width = 100, height = 20, enter = true })",
			"Breakpoint Float",
		},
		{
			"n",
			"<leader>dfs",
			"lua require('dapui').float_element('stacks', { width = 100, height = 20, enter = true })",
			"Stacks Float",
		},
		{
			"n",
			"<leader>dfw",
			"lua require('dapui').float_element('watches', { width = 100, height = 20, enter = true })",
			"Watches Float",
		},
		-- End --

		{
			"n",
			"<leader>dh",
			"lua require('dap.ui.widgets').hover()",
			"Hover Variables",
		},
		{ "n", "<leader>dS", "lua require('dap.ui.widgets').scopes()", "Scopes" },
		{ "n", "<leader>di", "lua require('dap').step_into()", "Step Into" },
		{ "n", "<leader>do", "lua require('dap').step_over()", "Step Over" },
		{ "n", "<leader>dp", "lua require('dap').pause.toggle()", "Pause" },
		{ "n", "<leader>dq", "lua require('dap').close()", "Quit" },
		{ "n", "<leader>dr", "lua require('dap').repl.toggle()", "Toggle Repl" },
		{ "n", "<leader>ds", "lua require('dap').continue()", "Start" },
		{ "n", "<leader>dt", "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
		{ "n", "<leader>dx", "lua require('dap').terminate()", "Terminate" },
		{ "n", "<leader>du", "lua require('dap').step_out()", "Step Out" },

		{ "v", "<leader>e", "lua require('dapui').eval()", "Evaluate" },
	},
	neotest = {

		{ "n", "<leader>ta", "lua require('neotest').run.attach()", "Attach" },
		{
			"n",
			"<leader>tf",
			"lua require('neotest').run.run(vim.fn.expand(' % '))",
			"Run File",
		},
		{
			"n",
			"<leader>tF",
			"lua require('neotest').run.run({ vim.fn.expand(' % '), strategy = 'dap' })",
			"Debug File",
		},
		{ "n", "<leader>tl", "lua require('neotest').run.run_last()", "Run Last" },
		{
			"n",
			"<leader>tL",
			"lua require('neotest').run.run_last({ strategy = 'dap' })",
			"Debug Last",
		},
		{ "n", "<leader>tn", "lua require('neotest').run.run()", "Run Nearest" },
		{
			"n",
			"<leader>tN",
			"lua require('neotest').run.run({ strategy = 'dap' })",
			"Debug Nearest",
		},
		{
			"n",
			"<leader>to",
			"lua require('neotest').output.open({ enter = true, short = true })",
			"Output",
		},
		{ "n", "<leader>tS", "lua require('neotest').run.stop()", "Stop" },
		{ "n", "<leader>ts", "lua require('neotest').summary.toggle()", "Summary" },

		{ "n", "<leader>tp", "<Plug>PlenaryTestFile<cr>", "Plenary TestFile" },
		{ "n", "<leader>tv", "<cmd>TestVisit<cr>", "Visit" },
		{ "n", "<leader>tx", "<cmd>TestSuite<cr>", "Suite" },
	},
	trouble = {

		{ "n", "<leader>xx", "<cmd>TroubleToggle<cr>", "Trouble Toggle" },
		{ "n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", "Touble workspace" },
		{ "n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", "Touble document" },
		{ "n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", "Trouble qf" },
		{ "n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", "Trouble loclist" },
	},
	Hop = {

		{ "n", "F", "<cmd>HopWord<cr>", "HopWord" },
	},
	navigator = {

		{ "n", "K", "lua vim.lsp.buf.hover()", "Hover Docs" },
		{
			"n",
			"gr",
			"lua require('navigator.reference').async_ref()",
			"Async Reference",
		},
		{
			"n",
			"<leader>gr",
			"lua require('navigator.reference').reference()",
			"Reference",
		},
		{
			"n",
			"g0",
			"lua require('navigator.symbols').document_symbols()",
			"Document Symbols",
		},
		{
			"n",
			"gW",
			"lua require('navigator.workspace').workspace_symbol_live()",
			"Workspace symbol live",
		},
		-- {"n","<c-]>",
		-- function()
		-- require('navigator.definition').definition()
		-- end,
		-- "Definition",
		-- },
		{
			"n",
			"gd",
			"lua require('navigator.definition').definition()",
			"Definition",
		},
		{ "n", "gD", "lua vim.lsp.buf.declaration()", "declaration" },
		{
			"n",
			"gp",
			"lua require('navigator.definition').definition_preview()",
			"Definition Preview",
		},
		{
			"n",
			"<leader>gt",
			"lua require('navigator.treesitter').buf_ts()",
			"Buffer ts",
		},
		{
			"n",
			"<leader>gT",
			"lua require('navigator.treesitter').bufs_ts()",
			"Buffers ts",
		},
		{ "n", "<leader>ct", "lua require('navigator.ctags').ctags()", "ctags" },
		{
			"n",
			"<leader>ca",
			"lua require('navigator.codeAction').code_action()",
			"Code Action",
		},
		{ "n", "<Space>rn", "lua require('navigator.rename').rename()", "rename" },
		{ "n", "<Leader>gi", "lua vim.lsp.buf.incoming_calls()", "incoming_calls" },
		{ "n", "<Leader>go", "lua vim.lsp.buf.outgoing_calls()", "outgoing_calls" },
		{ "n", "gi", "lua vim.lsp.buf.implementation()", "implementation" },
		{ "n", "<leader>D", "lua vim.lsp.buf.type_definition()", "type_definition" },
		{
			"n",
			"gL",
			"lua require('navigator.diagnostics').show_diagnostics()",
			"show_diagnostics",
		},
		{
			"n",
			"gG",
			"lua require('navigator.diagnostics').show_buf_diagnostics()",
			"show_buf_diagnostics",
		},
		{
			"n",
			"<Leader>dt",
			"lua require('navigator.diagnostics').toggle_diagnostics()",
			"toggle_diagnostics",
		},
		{ "n", "]d", "lua vim.diagnostic.goto_next()", "next diagnostics" },
		{ "n", "[d", "lua vim.diagnostic.goto_prev()", "prev diagnostics" },
		{ "n", "]O", "lua vim.diagnostic.set_loclist()", "diagnostics set loclist" },
		{
			"n",
			"]r",
			"lua require('navigator.treesitter').goto_next_usage()",
			"goto_next_usage",
		},
		{
			"n",
			"[r",
			"lua require('navigator.treesitter').goto_previous_usage()",
			"goto_previous_usage",
		},
		{ "n", "<C-LeftMouse>", "lua vim.lsp.buf.definition()", "definition" },
		{ "n", "g<LeftMouse>", "lua vim.lsp.buf.implementation()", "implementation" },
		{
			"n",
			"<Leader>k",
			"lua require('navigator.dochighlight').hi_symbol()",
			"hi_symbol",
		},
		{
			"n",
			"<leader>wa",
			"lua require('navigator.workleader').add_workleader_folder()",
			"add_workleader_folder",
		},
		{
			"n",
			"<Space>wl",
			"lua require('navigator.workspace').list_workspace_folders()",
			"list_workspace_folders",
		},
		{
			"n",
			"<Space>la",
			"lua require('navigator.codelens').run_action()",
			"run code lens action",
		},

		{ "i", "<C-k>", "lua vim.lsp.buf.signature_help()", "Signature Help" },

		{
			"v",
			"<leader>ca",
			"lua require('navigator.codeAction').range_code_action()",
			"Range Code Actions",
		},
	},
}
