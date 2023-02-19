local present, treesitter = pcall(require, "nvim-treesitter.configs")

if not present then
	return
end

local options = {
	ensure_installed = {
		"bash",
		"cpp",
		"c",
		"c_sharp",
		"css",
		"dockerfile",
		"graphql",
		"go",
		"html",
		"javascript",
		"java",
		"json",
		"kotlin",
		"lua",
		"markdown",
		"make",
		"python",
		"php",
		"proto",
		"perl",
		"ruby",
		"rust",
		"scss",
		"solidity",
		"typescript",
		"tsx",
		"toml",
		"vim",
		"yaml",
		"http",
		"markdown",
		"markdown_inline",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	autotag = {
		enable = true,
	},
}

treesitter.setup(options)
