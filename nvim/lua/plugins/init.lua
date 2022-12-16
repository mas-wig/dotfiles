local packer = require("core.utils")
local command = require("plugins.plugins_command")

local config = {
	profile = {
		enable = true,
		threshold = 0,
	},
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
}

local function plugins(use)
	use({ "lewis6991/impatient.nvim" })
	use({ "nathom/filetype.nvim" })
	use({ "wbthomason/packer.nvim", opt = true })

	use({
		"nvim-telescope/telescope.nvim",
		requires = command.telescope_req,
		cmd = "Telescope",
		config = function()
			require("plugins.configs.telescope")
		end,
	})

	use({
		"rafamadriz/friendly-snippets",
		module = { "cmp", "cmp_nvim_lsp" },
		event = "InsertEnter",
	})

	use({
		"hrsh7th/nvim-cmp",
		after = "friendly-snippets",
		config = function()
			require("plugins.configs.cmp").cmpconfig()
		end,
	})

	use({
		"tzachar/cmp-tabnine",
		after = "nvim-cmp",
		run = "./install.sh",
		config = function()
			require("plugins.configs.cmp").tabnine()
		end,
		event = "InsertEnter",
	})

	use({
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.cmp").luasnip()
		end,
	})

	use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })

	use({ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" })

	use({ "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" })

	use({ "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" })

	use({ "hrsh7th/cmp-path", after = "cmp-buffer" })

	use({
		"neovim/nvim-lspconfig",
		opt = true,
		setup = function()
			vim.defer_fn(function()
				require("core.utils").on_file_open("nvim-lspconfig")
			end, 0)
		end,
	})

	use({
		"ray-x/navigator.lua",
		after = "nvim-lspconfig",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("plugins.configs.navigator")
		end,
	})

	use({
		"williamboman/mason.nvim",
		cmd = command.mason,
		config = function()
			pcall(require, "plugins.configs.mason")
		end,
	})

	use({
		"SmiteshP/nvim-navic",
		after = "nvim-lspconfig",
		requires = "neovim/nvim-lspconfig",
		events = { "BufRead", "BufWinEnter", "BufNewFile" },
		config = {
			function()
				require("plugins.configs.navic").setup()
			end,
		},
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		cmd = command.treesitter,
		module = "nvim-treesitter",
		setup = function()
			require("core.utils").on_file_open("nvim-treesitter")
		end,
		run = ":TSUpdate",
		opt = true,
		config = function()
			pcall(require, "plugins.configs.treesitter")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		cmd = { "Gitsigns" },
		config = function()
			pcall(require, "plugins.configs.gitsigns")
		end,
	})

	use({
		"folke/tokyonight.nvim",
		event = "VimEnter",
		config = function()
			pcall(require, "plugins.configs.tokyonight")
		end,
	})

	use({
		"nvim-lualine/lualine.nvim",
		event = "VimEnter",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			pcall(require, "plugins.configs.lualine")
		end,
	})

	use({
		"akinsho/bufferline.nvim",
		after = "tokyonight.nvim",
		requires = { { "kyazdani42/nvim-web-devicons" } },
		config = function()
			pcall(require, "plugins.configs.bufferline")
		end,
	})

	use({
		"tiagovla/scope.nvim",
		after = "bufferline.nvim",
		config = function()
			require("scope").setup()
		end,
	})

	use({
		"mhartington/formatter.nvim",
		opt = true,
		cmd = { "Format", "FormatWrite" },
		config = function()
			require("plugins.configs.formatter")
		end,
	})

	use({
		"NvChad/nvterm",
		opt = true,
		event = "VimEnter",
		config = {
			function()
				pcall(require, "plugins.configs.nvterm")
			end,
		},
	})

	use({
		"kyazdani42/nvim-tree.lua",
		cmd = { "NvimTreeToggle", "NvimTreeFocus" },
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
		config = function()
			pcall(require, "plugins.configs.nvimtree")
		end,
	})

	use({
		"NTBBloodbath/rest.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		opt = true,
		ft = { "http" },
		config = function()
			pcall(require, "plugins.configs.rest")
		end,
	})

	use({
		"CRAG666/code_runner.nvim",
		opt = true,
		cmd = command.code_runner,
		requires = "nvim-lua/plenary.nvim",
		config = function()
			pcall(require, "plugins.configs.code_runner")
		end,
	})

	use({
		"mfussenegger/nvim-dap",
		opt = true,
		event = "BufReadPre",
		setup = function() end,
		config = function()
			require("plugins.configs.dap").dapconfig()
		end,
	})

	use({
		"theHamsta/nvim-dap-virtual-text",
		after = "nvim-dap",
		requires = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("plugins.configs.dap").dap_virtual_text()
		end,
	})

	use({
		"rcarriga/nvim-dap-ui",
		after = "nvim-dap",
		requires = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("plugins.configs.dap").dapui()
		end,
	})

	use({
		"mxsdev/nvim-dap-vscode-js",
		requires = { "mfussenegger/nvim-dap" },
		ft = { "jsx", "js", "ts", "tsx" },
		config = function()
			require("plugins.configs.dap").javascript()
		end,
	})

	use({
		"nvim-neotest/neotest",
		opt = true,
		requires = command.noetest_req,
		module = { "neotest", "neotest.async" },
		wants = command.neotest_want,
		cmd = command.neotest,
		config = function()
			require("plugins.configs.neotest")
		end,
	})

	use({
		"stevearc/overseer.nvim",
		opt = true,
		cmd = command.overseer,
		config = function()
			pcall(require, "plugins.configs.overseer")
		end,
	})

	use({
		"akinsho/flutter-tools.nvim",
		requires = "nvim-lua/plenary.nvim",
		cmd = command.flutter,
		config = function()
			pcall(require, "plugins.configs.main.flutter")
		end,
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		cmd = { "TroubleToggle" },
		config = function()
			require("plugins.configs.others").trouble()
		end,
	})

	use({
		"chrisbra/csv.vim",
		ft = "csv",
		config = function()
			vim.cmd([[
		augroup filetypedetect
		  au! BufRead,BufNewFile *.csv,*.dat setfiletype csv
		augroup END
		]])
		end,
	})

	use({
		"tpope/vim-dadbod",
		opt = true,
		requires = command.dbui_req,
		cmd = command.dbui,
	})

	use({
		"ray-x/go.nvim",
		requires = "ray-x/guihua.lua",
		ft = { "go" },
		config = function()
			require("plugins.configs.go")
		end,
	})

	use({
		"NvChad/nvim-colorizer.lua",
		ft = { "css", "lua", "scss" },
		config = function()
			require("plugins.configs.others").colorizer()
		end,
	})

	use({ "windwp/nvim-ts-autotag", ft = { "html", "jsx", "tsx", "vue" } })

	use({ "p00f/nvim-ts-rainbow", event = "BufRead" })

	use({
		"windwp/nvim-autopairs",
		event = "BufRead",
		after = "nvim-cmp",
		config = function()
			require("plugins.configs.others").autopairs()
		end,
	})

	use({
		"lukas-reineke/indent-blankline.nvim",
		event = "BufRead",
		config = function()
			require("plugins.configs.others").iblankline()
		end,
	})

	use({
		"numToStr/Comment.nvim",
		event = "BufReadPre",
	})

	use({
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
	})

	use({
		"anuvyklack/pretty-fold.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("plugins.configs.others").pretty_fold()
		end,
	})

	use({
		"phaazon/hop.nvim",
		branch = "v2",
		cmd = { "HopWord", "HopChar1" },
		config = function()
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	use({
		"folke/which-key.nvim",
		opt = true,
		config = function()
			require("plugins.configs.which_key").setup()
		end,
	})
end

return packer.setup(config, plugins)
