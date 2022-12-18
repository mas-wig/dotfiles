vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.timeoutlen = 300
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.laststatus = 0
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 250
vim.opt.undofile = true
vim.opt.undolevels = 10000

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 1
vim.opt.foldenable = true

vim.o.showtabline = 5
vim.g.mapleader = " "
vim.g.maplocalleader = " "
---
local default_providers = {
	"node",
	"perl",
	"python3",
	"ruby",
}

for _, provider in ipairs(default_providers) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.cmd([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]])

vim.cmd([[ 
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
]])

vim.api.nvim_create_autocmd("InsertEnter", {
	command = ":set formatoptions-=ro",
})

vim.api.nvim_create_autocmd("VimLeave", {
	command = ":!killall node",
})

vim.api.nvim_create_autocmd("VimLeave", {
	command = ":wall",
})

vim.cmd("hi Normal ctermbg=NONE")

vim.g.db_ui_use_nerd_fonts = 1
vim.g.navic_silence = true
vim.g.db_ui_save_location = "~/.config/nvim/db"
