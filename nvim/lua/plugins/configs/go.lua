local present_a, go = pcall(require, "go")
local present, navic = pcall(require, "nvim-navic")

if not present and present_a then
	return
end

local opt = {
	disable_defaults = false,
	go = "go",
	goimport = "goimports",
	fillstruct = "fillstruct",
	gofmt = "gofmt",
	max_line_len = 128,
	tag_transform = false,
	tag_options = "json=omitempty",
	gotests_template = "",
	gotests_template_dir = "",
	comment_placeholder = "",
	icons = { breakpoint = "🧘", currentpos = "🏃" },
	verbose = false,
	lsp_cfg = true,
	lsp_gofumpt = false,
	lsp_on_attach = function(client, bufnr)
		if client.server_capabilities.documentSymbolProvider then
			navic.attach(client, bufnr)
		end
	end,
	lsp_keymaps = false,
	lsp_codelens = true,
	lsp_diag_hdlr = true,
	lsp_diag_underline = true,
	lsp_diag_virtual_text = { space = 0, prefix = "" },
	lsp_diag_signs = true,
	lsp_diag_update_in_insert = true,
	lsp_document_formatting = true,
	lsp_inlay_hints = {
		enable = true,
		only_current_line = false,
		only_current_line_autocmd = "CursorHold",
		show_variable_name = true,
		parameter_hints_prefix = " ",
		show_parameter_hints = true,
		other_hints_prefix = "=> ",
		max_len_align = false,
		max_len_align_padding = 1,
		right_align = false,
		right_align_padding = 6,
		highlight = "Comment",
	},
	gopls_cmd = nil,
	gopls_remote_auto = true,
	gocoverage_sign = "█",
	sign_priority = 5,
	dap_debug = true,
	dap_debug_keymap = true,
	dap_debug_gui = true,
	dap_debug_vt = true,
	build_tags = "tag1,tag2",
	textobjects = true,
	test_runner = "go",
	verbose_tests = true,
	run_in_floaterm = false,
	trouble = false,
	test_efm = false,
	luasnip = true,
}

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require("go.format").goimport()
	end,
	group = format_sync_grp,
})

go.setup(opt)
