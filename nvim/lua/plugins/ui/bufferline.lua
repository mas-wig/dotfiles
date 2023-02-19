local present, bufferline = pcall(require, "bufferline")

if not present then
	return
end

return bufferline.setup({
	highlights = {
		modified_selected = {
			bg = "#862d86",
		},
		close_button_selected = {
			fg = "#ff3333",
			bg = "#862d86",
		},
		buffer_selected = {
			fg = "#ccffff",
			bg = "#862d86",
			bold = false,
			italic = false,
		},
		separator_selected = {
			bg = "#862d86",
		},
	},

	options = {
		mode = "buffers",
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15,
		truncate_names = true,
		tab_size = 17,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true,
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_buffer_default_icon = true,
		show_close_icon = true,
		show_tab_indicators = true,
		show_duplicate_prefix = true,
		persist_buffer_sort = true,
		separator_style = "slant",
		enforce_regular_tabs = false,
		always_show_bufferline = false,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		sort_by = "insert_after_current",
		custom_areas = {
			right = function()
				local result = {}
				local seve = vim.diagnostic.severity
				local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
				local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
				local info = #vim.diagnostic.get(0, { severity = seve.INFO })
				local hint = #vim.diagnostic.get(0, { severity = seve.HINT })
				if error ~= 0 then
					table.insert(result, { text = "  " .. error .. " ", fg = "#EC5241" })
				end
				if warning ~= 0 then
					table.insert(result, { text = "  " .. warning .. " ", fg = "#EFB839" })
				end
				if hint ~= 0 then
					table.insert(result, { text = "  " .. hint .. " ", fg = "#A3BA5E" })
				end
				if info ~= 0 then
					table.insert(result, { text = "  " .. info .. " ", fg = "#7EA9A7" })
				end
				return result
			end,
		},
	},
})
