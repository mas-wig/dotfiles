local present_a, lualine = pcall(require, "lualine")

if not present_a then
	return
end

local colors = {
	sep = "#1a1b26",
	red = "#ca1243",
	white = "#f3f3f3",
	yellow = "#e6e600",
	blue = " #1a75ff",
	green = "#33cc33",
}

local empty = require("lualine.component"):extend()
function empty:draw(default_highlight)
	self.status = ""
	self.applied_separator = ""
	self:apply_highlights(default_highlight)
	self:apply_section_separators()
	return self.status
end

local function process_sections(sections)
	for name, section in pairs(sections) do
		local left = name:sub(9, 10) < "x"

		for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
			table.insert(section, pos * 2, { empty, color = { fg = colors.sep, bg = colors.sep } })
		end

		for id, comp in ipairs(section) do
			if type(comp) ~= "table" then
				comp = { comp }
				section[id] = comp
			end
			comp.separator = left and { right = "" } or { left = "" }
		end
	end
	return sections
end

local lspstatus = function()
	if rawget(vim, "lsp") then
		for _, client in ipairs(vim.lsp.get_active_clients()) do
			if client.attached_buffers[vim.api.nvim_get_current_buf()] then
				return client.name .. " 🪷"
			end
		end
	end
end

local setup = {
	options = {
		icons_enabled = true,
		theme = "dracula",
		component_separators = "",
		section_separators = "",
		disabled_filetypes = {
			"packer",
			"NvimTree",
		},
		always_divide_middle = true,
		ignore_focus = { "terminal" },
	},
	sections = process_sections({
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diff",
				diff_color = {
					added = { fg = "#1aff1a" },
					modified = { fg = "#e6e600" },
					removed = { fg = "#ff4d4d" },
				},
				symbols = { added = "🟢 ", modified = " 🟡 ", removed = " 🔴 " },
			},
		},
		lualine_c = {
			{ "filename" },
		},
		lualine_x = {
			{
				"diagnostics",
				source = { "nvim_lsp" },
				sections = { "error" },
				symbols = { error = " " },
				update_in_insert = true,
				diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
			},
			{
				"diagnostics",
				source = { "nvim_lsp" },
				sections = { "warn" },
				symbols = { warn = " " },
				update_in_insert = true,
				diagnostics_color = { warn = { bg = colors.yellow, fg = "#000000" } },
			},
			{
				"diagnostics",
				source = { "nvim_lsp" },
				sections = { "info" },
				symbols = { info = " " },
				update_in_insert = true,
				diagnostics_color = { warn = { bg = colors.blue, fg = "#000000" } },
			},
			{
				"diagnostics",
				source = { "nvim_lsp" },
				sections = { "hint" },
				symbols = { hint = " " },
				update_in_insert = true,
				diagnostics_color = { warn = { bg = colors.green, fg = "#000000" } },
			},
			{ lspstatus },
			{ "filetype" },
		},
		lualine_y = { "progress" },
		lualine_z = { "location" },
	}),

	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
}

lualine.setup(setup)
