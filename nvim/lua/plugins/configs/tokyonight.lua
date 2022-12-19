local present, tokyonight = pcall(require, "tokyonight")

if not present then
	return
end

local config = require("tokyonight.config")
local colors = require("tokyonight.colors")

local options = config.options
local theme = {
	config = options,
	colors = colors.setup(),
}

local c = theme.colors

local cfg = {
	style = "night",
	transparent = false,
	terminal_colors = true,
	styles = {
		comments = { italic = true },
		keywords = { italic = true },
		functions = { italic = true },
		variables = {},
		sidebars = "dark",
		floats = "dark",
	},
	sidebars = { "qf", "help", "nvimtree", "terminal" },
	day_brightness = 1,
	hide_inactive_statusline = false,
	dim_inactive = true,
	lualine_bold = false,

	-- on_colors = function(colors) end,

	on_highlights = function(hl, _)
		-- hl["@field"] = { fg = "#ace600" }
		hl.WinSeparator = { fg = "#33ffad" }
		hl.IndentBlanklineContextChar = { fg = "#00cc7a", nocombine = true }
		hl.Folded = { fg = "#ace600", bg = "#34444c" }
		hl.NvimTreeIndentMarker = { fg = "#b30077" }
		hl.NvimTreeWinSeparator = { fg = "#2eb8b8" }

		hl.TelescopeBorder = {
			fg = "#99e600", -- bg = "#1a1b26",
		}

		hl.NormalFloat = { fg = c.fg_float, bg = "" } -- Normal text in floating windows.
		hl.FloatBorder = { fg = c.border_highlight, bg = "" }

		hl.TelescopePromptTitle = { bg = "#ff1a1a", fg = "#111a00" }
		hl.TelescopePreviewTitle = { bg = "#1affff", fg = "#111a00" }
		hl.TelescopeResultsTitle = { bg = "#ff33ff", fg = "#111a00" }
		hl.TelescopeNormal = { bg = "" }
		hl.LineNr = { fg = "#ffffff" } -- Line Nummber

		hl.NavicSeparator = { fg = "#1affd1", bg = "" }
		hl.NavicText = { fg = "#ff3385", bg = "", italic = false }
		hl.NavicIconsFile = { bg = "" }
		hl.NavicIconsModule = { bg = "" }
		hl.NavicIconsNamespace = { bg = "" }
		hl.NavicIconsPackage = { bg = "" }
		hl.NavicIconsClass = { bg = "" }
		hl.NavicIconsMethod = { bg = "" }
		hl.NavicIconsProperty = { bg = "" }
		hl.NavicIconsField = { bg = "" }
		hl.NavicIconsConstructor = { bg = "" }
		hl.NavicIconsEnum = { bg = "" }
		hl.NavicIconsInterface = { bg = "" }
		hl.NavicIconsFunction = { bg = "" }
		hl.NavicIconsVariable = { bg = "" }
		hl.NavicIconsConstant = { bg = "" }
		hl.NavicIconsString = { bg = "" }
		hl.NavicIconsNumber = { bg = "" }
		hl.NavicIconsBoolean = { bg = "" }
		hl.NavicIconsArray = { bg = "" }
		hl.NavicIconsObject = { bg = "" }
		hl.NavicIconsKey = { bg = "" }
		hl.NavicIconsKeyword = { bg = "" }
		hl.NavicIconsNull = { bg = "" }
		hl.NavicIconsEnumMember = { bg = "" }
		hl.NavicIconsStruct = { bg = "" }
		hl.NavicIconsEvent = { bg = "" }
		hl.NavicIconsOperator = { bg = "" }
		hl.NavicIconsTypeParameter = { bg = "" }
	end,
}

tokyonight.setup(cfg)
vim.cmd([[colorscheme tokyonight]])
