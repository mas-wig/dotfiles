local present, bufferline = pcall(require, "bufferline")

if not present then
	return
end

local setup = {
	options = {
		mode = "buffers", -- ganti buffers ato tabs klo mau
		separator_style = { " ", " " }, --"slant",
		themable = true,
		color_icons = true,
		left_trunc_marker = "🌎",
		right_trunc_marker = "🌝",
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_tab_indicators = true,
		buffer_close_icon = "ﱣ",
		modified_icon = "ﱣ",
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
			fg = "#e6e600",
		},
		close_button_selected = {
			fg = "#ff3333",
		},
		buffer_selected = {
			fg = "#ccffff",
			bold = true,
			italic = true,
		},
	},
}

bufferline.setup(setup)
