return {
	{ "lewis6991/impatient.nvim" },
	{ "nathom/filetype.nvim" },

	{ "wbthomason/packer.nvim", opt = true },

	{
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-media-files.nvim",
		},
		cmd = "Telescope",
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").telescope)
		end,
		config = function()
			require("plugins.configs.telescope")
		end,
	},

	{
		"rafamadriz/friendly-snippets",
		module = { "cmp", "cmp_nvim_lsp" },
		event = "InsertEnter",
	},

	{
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
		config = function()
			require("plugins.configs.cmp").cmpconfig()
		end,
	},

	{
		"tzachar/cmp-tabnine",
		after = "nvim-cmp",
		run = "./install.sh",
		config = function()
			require("plugins.configs.cmp").tabnine()
		end,
		event = "InsertEnter",
	},

	{
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.cmp").luasnip()
		end,
	},

	{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },

	{ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" },

	{ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" },

	{ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" },

	{ "hrsh7th/cmp-path", after = "cmp-buffer" },

	{
		"neovim/nvim-lspconfig",
		opt = true,
		setup = function()
			vim.defer_fn(function()
				require("core.utils").on_file_open("nvim-lspconfig")
			end, 0)
		end,
	},

	{
		"ray-x/navigator.lua",
		after = "nvim-lspconfig",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").navigator)
		end,
		config = function()
			require("plugins.configs.navigator")
		end,
	},

	{
		"williamboman/mason.nvim",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonInstallAll",
			"MasonUninstall",
			"MasonUninstallAll",
			"MasonLog",
		},
		config = function()
			pcall(require, "plugins.configs.mason")
		end,
	},

	{
		"SmiteshP/nvim-navic",
		after = "nvim-lspconfig",
		requires = "neovim/nvim-lspconfig",
		events = { "BufRead", "BufWinEnter", "BufNewFile" },
		config = {
			function()
				require("plugins.configs.navic").setup()
			end,
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		cmd = {
			"TSInstall",
			"TSBufEnable",
			"TSBufDisable",
			"TSEnable",
			"TSDisable",
			"TSModuleInfo",
		},
		module = "nvim-treesitter",
		setup = function()
			require("core.utils").on_file_open("nvim-treesitter")
		end,
		run = ":TSUpdate",
		opt = true,
		config = function()
			pcall(require, "plugins.configs.treesitter")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		ft = "gitcommit",
		setup = function()
			require("core.utils").gitsigns()
			require("core.utils").load_plugins_keymap(require("core.mappings").gitsigns)
		end,
		config = function()
			pcall(require, "plugins.configs.gitsigns")
		end,
	},

	{
		"folke/tokyonight.nvim",
		event = "VimEnter",
		config = function()
			pcall(require, "plugins.configs.tokyonight")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			pcall(require, "plugins.configs.lualine")
		end,
	},

	{
		"akinsho/bufferline.nvim",
		after = "tokyonight.nvim",
		requires = { { "kyazdani42/nvim-web-devicons" } },
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").bufferline)
		end,
		config = function()
			pcall(require, "plugins.configs.bufferline")
		end,
	},

	{
		"tiagovla/scope.nvim",
		after = "bufferline.nvim",
		config = function()
			require("scope").setup()
		end,
	},

	{
		"mhartington/formatter.nvim",
		opt = true,
		cmd = { "Format", "FormatWrite" },
		config = function()
			require("plugins.configs.formatter")
		end,
	},

	{
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").nvimtree)
		end,
		config = function()
			pcall(require, "plugins.configs.nvimtree")
		end,
	},

	{
		"NTBBloodbath/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		opt = true,
		ft = { "http" },
		config = function()
			pcall(require, "plugins.configs.rest")
		end,
	},

	{
		"CRAG666/code_runner.nvim",
		opt = true,
		cmd = { "RunCode", "RunFile", "RunProject", "RunClose", "CRFiletype", "CRProjects" },
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").code_runner)
		end,
		requires = "nvim-lua/plenary.nvim",
		config = function()
			pcall(require, "plugins.configs.code_runner")
		end,
	},

	{
		"mfussenegger/nvim-dap",
		opt = true,
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").dap)
		end,
		config = function()
			require("plugins.configs.dap").dapconfig()
		end,
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		after = "nvim-dap",
		requires = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("plugins.configs.dap").dap_virtual_text()
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		after = "nvim-dap",
		requires = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("plugins.configs.dap").dapui()
		end,
	},

	{
		"mxsdev/nvim-dap-vscode-js",
		requires = { "mfussenegger/nvim-dap" },
		ft = { "jsx", "js", "ts", "tsx" },
		config = function()
			require("plugins.configs.dap").javascript()
		end,
	},

	{
		"nvim-neotest/neotest",
		opt = true,
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").neotest)
		end,
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-neotest/neotest-go",
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-python",
		},
		module = { "neotest", "neotest.async" },
		wants = {
			"plenary.nvim",
			"nvim-treesitter",
			"FixCursorHold.nvim",
			"neotest-go",
			"neotest-jest",
			"neotest-python",
		},
		cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
		config = function()
			require("plugins.configs.neotest")
		end,
	},

	{
		"akinsho/flutter-tools.nvim",
		requires = "nvim-lua/plenary.nvim",
		cmd = {
			"FlutterRun",
			"FlutterDevices",
			"FlutterEmulators",
			"FlutterReload",
			"FlutterRestart",
			"FlutterQuit",
			"FlutterDetach",
			"FlutterOutlineToggle",
			"FlutterOutlineOpen",
			"FlutterDevTools",
			"FlutterCopyProfilerUrl",
			"FlutterLspRestart",
			"FlutterSuper",
			"FlutterReanalyze",
		},
		config = function()
			pcall(require, "plugins.configs.main.flutter")
		end,
	},

	{
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		cmd = { "Trouble", "TroubleClose", "TroubleRefresh", "TroubleToggle" },
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").trouble)
		end,
		config = function()
			require("plugins.configs.others").trouble()
		end,
	},

	{
		"chrisbra/csv.vim",
		ft = "csv",
		config = function()
			vim.cmd([[
		augroup filetypedetect
		  au! BufRead,BufNewFile *.csv,*.dat setfiletype csv
		augroup END
		]])
		end,
	},

	{
		"tpope/vim-dadbod",
		opt = true,
		requires = { "kristijanhusak/vim-dadbod-ui" },
		cmd = {
			"DBUI",
			"DBUIAddConnection",
			"DBUIFindBuffer",
			"DBUILastQueryInfo",
			"DBUIToggle",
			"DBUIRenameBuffer",
		},
	},

	{
		"ray-x/go.nvim",
		requires = "ray-x/guihua.lua",
		ft = { "go" },
		config = function()
			require("plugins.configs.go")
		end,
	},

	{
		"NvChad/nvim-colorizer.lua",
		ft = { "css", "lua", "scss" },
		config = function()
			require("plugins.configs.others").colorizer()
		end,
	},

	{ "windwp/nvim-ts-autotag", ft = { "html", "jsx", "tsx", "vue" } },

	{ "p00f/nvim-ts-rainbow", event = "BufRead" },

	{
		"windwp/nvim-autopairs",
		event = "BufRead",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.others").autopairs()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.others").iblankline()
		end,
	},

	{
		"numToStr/Comment.nvim",
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").comment)
		end,
	},

	{
		"folke/noice.nvim",
		requires = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		event = "VimEnter",
		after = "nvim-treesitter",
		config = function()
			require("plugins.configs.others").noices()
		end,
	},

	{
		"phaazon/hop.nvim",
		branch = "v2",
		cmd = { "HopWord", "HopChar1" },
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").Hop)
		end,
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		cmd = "ToggleTerm",
		tag = "*",
		setup = function()
			require("core.utils").load_plugins_keymap(require("core.mappings").toggleterm)
		end,
		config = function()
			require("plugins.configs.toggleterm")
		end,
	},

	{
		"jackMort/ChatGPT.nvim",
		cmd = { "ChatGPT", "ChatGPTActAs" },
		setup = function()
			vim.schedule(function()
				require("packer").loader("telescope.nvim")
			end)
		end,
		requires = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("plugins.configs.chatgpt")
		end,
	},

	{
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
		keys = { "zc", "zo", "zM", "zR" },
		config = function()
			require("plugins.configs.others").ufo()
		end,
	},

	{
		"folke/which-key.nvim",
		opt = true,
		config = function()
			require("plugins.configs.which_key").setup()
		end,
	},
}
