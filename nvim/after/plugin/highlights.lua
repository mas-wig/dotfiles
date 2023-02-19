local config = require("tokyonight.config")
local colors = require("tokyonight.colors")

local options = config.options

local theme = {
	config = options,
	colors = colors.setup(),
}

local c = theme.colors

local hl = {
	-- Telescope --
	{ 0, "TelescopePromptTitle", { bg = "#ff1a1a", fg = "#111a00" } },
	{ 0, "TelescopePreviewTitle", { bg = "#1affff", fg = "#111a00" } },
	{ 0, "TelescopeResultsTitle", { bg = "#ff33ff", fg = "#111a00" } },
	{ 0, "TelescopeNormal", { bg = "" } },
	{ 0, "TelescopeBorder", { fg = "#99e600" } },

	-- Navic --
	{ 0, "NvimTreeIndentMarker", { fg = "#b30077" } },
	{ 0, "NvimTreeWinSeparator", { fg = "#2eb8b8" } },
	{ 0, "NvimTreeNormal", { fg = c.fg_sidebar, bg = "none" } },

	{ 0, "WinSeparator", { fg = "#33ffad" } },
	{ 0, "Folded", { fg = "#ace600", bg = "#34444c" } },

	{ 0, "WhichKey", { fg = c.cyan, bg = "" } },
	{ 0, "WhichKeyFloat", { bg = "" } },

	{ 0, "NormalFloat", { fg = c.fg_float, bg = "none" } },
	{ 0, "FloatBorder", { fg = c.border_highlight, bg = "none" } },
	{ 0, "LineNr", { fg = "#ffffff" } }, -- Line Nummber

	{ 0, "NotifyBackground", { bg = "" } },
	{ 0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE" } },
	{ 0, "IndentBlanklineContextStart", { fg = "#e6e600", sp = "#e6e600", underline = false } },
	{ 0, "IndentBlanklineChar", { fg = "none", nocombine = true } },
	{ 0, "IndentBlanklineContextChar", { fg = "none", nocombine = true } },
}

for _, key in pairs(hl) do
	vim.api.nvim_set_hl(key[1], key[2], key[3])
end
