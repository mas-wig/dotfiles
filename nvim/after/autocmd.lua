local api = vim.api

local highlight_group = api.nvim_create_augroup("YankHighlight", { clear = true })
api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ timeout = 170 })
	end,
	group = highlight_group,
	pattern = "*",
})

local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, { pattern = "*", command = "set cursorline", group = cursorGrp })
api.nvim_create_autocmd(
	{ "InsertEnter", "WinLeave" },
	{ pattern = "*", command = "set nocursorline", group = cursorGrp }
)

vim.api.nvim_create_autocmd("InsertEnter", {
	command = ":set formatoptions-=ro",
})

vim.api.nvim_create_autocmd("VimLeave", {
	command = ":!killall node",
})

vim.api.nvim_create_autocmd("VimLeave", {
	command = ":wall",
})
