vim.cmd([[
  syntax off
  filetype off
  filetype plugin indent off
]])

vim.g.did_load_filetypes = 1
vim.opt.shadafile = "NONE"
vim.g.loaded_gzip = false
vim.g.loaded_netrwPlugin = false
vim.g.loaded_tarPlugin = false
vim.g.loaded_zipPlugin = false
vim.g.loaded_2html_plugin = false
vim.g.loaded_remote_plugins = false
vim.g.loaded_tar = false
vim.g.loaded_netrw = false
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

require("core.options")

vim.defer_fn(function()
	vim.opt.shadafile = ""

	vim.cmd([[
    rshada!
    doautocmd BufRead
    syntax on
    filetype on
    filetype plugin indent on
    ]])

	vim.defer_fn(function()
		vim.cmd([[
		PackerLoad impatient.nvim
		PackerLoad which-key.nvim
		silent! bufdo e
		]])
	end, 3)
end, 0)

require("plugins.plugins")
