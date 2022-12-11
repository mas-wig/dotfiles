local present, tokyonight = pcall(require, "tokyonight")

if not present then
	return
end

local options = {
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

	on_highlights = function(hl, _)
		hl.WinSeparator = { fg = "#33ffad" }
		hl.IndentBlanklineContextChar = { fg = "#00cc7a", nocombine = true }
		hl.NvimTreeIndentMarker = { fg = "#b30077" }
		hl.NvimTreeWinSeparator = { fg = "#2eb8b8" }
		hl.TelescopeBorder = {
			fg = "#99e600",
			-- bg = "#1a1b26",
		}
		hl.TelescopePromptTitle = {
			bg = "#ff1a1a",
			fg = "#111a00",
		}
		hl.TelescopePreviewTitle = {
			bg = "#1affff",
			fg = "#111a00",
		}
		hl.TelescopeResultsTitle = {
			bg = "#ff33ff",
			fg = "#111a00",
		}

		hl.LineNr = { fg = "#ffff1a" }

		hl.NavicSeparator = { fg = "#ffff1a", bg = "#263238" }
		hl.NavicText = { fg = "#ff3385", bg = "#263238" }
		hl.NavicIconsFile = { bg = "#263238" }
		hl.NavicIconsModule = { bg = "#263238" }
		hl.NavicIconsNamespace = { bg = "#263238" }
		hl.NavicIconsPackage = { bg = "#263238" }
		hl.NavicIconsClass = { bg = "#263238" }
		hl.NavicIconsMethod = { bg = "#263238" }
		hl.NavicIconsProperty = { bg = "#263238" }
		hl.NavicIconsField = { bg = "#263238" }
		hl.NavicIconsConstructor = { bg = "#263238" }
		hl.NavicIconsEnum = { bg = "#263238" }
		hl.NavicIconsInterface = { bg = "#263238" }
		hl.NavicIconsFunction = { bg = "#263238" }
		hl.NavicIconsVariable = { bg = "#263238" }
		hl.NavicIconsConstant = { bg = "#263238" }
		hl.NavicIconsString = { bg = "#263238" }
		hl.NavicIconsNumber = { bg = "#263238" }
		hl.NavicIconsBoolean = { bg = "#263238" }
		hl.NavicIconsArray = { bg = "#263238" }
		hl.NavicIconsObject = { bg = "#263238" }
		hl.NavicIconsKey = { bg = "#263238" }
		hl.NavicIconsKeyword = { bg = "#263238" }
		hl.NavicIconsNull = { bg = "#263238" }
		hl.NavicIconsEnumMember = { bg = "#263238" }
		hl.NavicIconsStruct = { bg = "#263238" }
		hl.NavicIconsEvent = { bg = "#263238" }
		hl.NavicIconsOperator = { bg = "#263238" }
		hl.NavicIconsTypeParameter = { bg = "#263238" }
	end,
}

tokyonight.setup(options)
vim.cmd([[colorscheme tokyonight]])
