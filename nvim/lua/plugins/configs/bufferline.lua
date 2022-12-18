local present, bufferline = pcall(require, "bufferline")

if not present then
	return
end

local setup = {
	options = {
		mode = "buffers", -- ganti buffers ato tabs klo mau
		separator_style = "thick", --"slant",
		themable = true,
		color_icons = true,
		left_trunc_marker = "🌎",
		right_trunc_marker = "🌝",
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_tab_indicators = true,
		buffer_close_icon = " ",
		modified_icon = "✏️",
		close_command = "bdelete! %d",
		enforce_regular_tabs = true,
		close_icon = "",
		always_show_bufferline = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				highlight = "Directory",
				separator = true,
			},
		},
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		indicator = {
			icon = "▎",
			style = "none",
		},
	},

	highlights = {
		separator = {
			fg = "#a6ff4d",
		},
		close_button_selected = {
			fg = "#ff3333",
		},
		buffer_selected = {
			fg = "#ff66ff",
			bold = true,
			italic = true,
		},
	},
}

bufferline.setup(setup)
