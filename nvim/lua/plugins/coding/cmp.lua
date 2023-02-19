local M = {}

M.cmpconfig = function()
	local present, cmp = pcall(require, "cmp")

	if not present then
		return
	end

	local cmp_kinds = {
		Text = "✏️  ",
		Method = "📦 ",
		Function = "🔧 ",
		Constructor = "🔩 ",
		Field = "🧲 ",
		Variable = "🔌 ",
		Class = "📚 ",
		Interface = "🎏 ",
		Module = "📜 ",
		Property = "🔮 ",
		Unit = "📏 ",
		Value = "📮 ",
		Enum = "📥 ",
		Keyword = "🔑 ",
		Snippet = "🎲 ",
		Color = "🎨 ",
		File = "📋 ",
		Reference = "🔗 ",
		Folder = "📁 ",
		EnumMember = "📐 ",
		Constant = "📤 ",
		Struct = "🎯 ",
		Event = "⏳ ",
		Operator = "🧭 ",
		TypeParameter = "🎈 ",
	}

	local options = {
		preselect = cmp.PreselectMode.None,
		sources = {
			{ name = "cmp_tabnine" },
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "nvim_lua" },
			{ name = "path" },
		},
		completion = {
			completeopt = "menu,menuone,noinsert",
		},
		window = {
			completion = {
				border = "single",
				winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
				side_padding = 1,
				scrollbar = false,
			},
			documentation = {
				border = "single",
			},
		},
		snippet = {
			expand = function(args)
				require("luasnip").lsp_expand(args.body)
			end,
		},
		formatting = {
			format = function(entry, vim_item)
				if entry.source.name == "cmp_tabnine" then
					local detail = (entry.completion_item.data or {}).detail
					if detail and detail:find(".*%%.*") then
						vim_item.kind = string.format("%s %s %s", "🔥", "Tabnine", detail)
					else
						vim_item.kind = string.format("%s %s", "✏️ ", "Text")
					end
				else
					local source = entry.source.name
					if source == "vsnip" or source == "nvim_lsp" or source == "cmp_tabnine" then
						vim_item.dup = 0
					end

					vim_item.kind = cmp_kinds[vim_item.kind] .. vim_item.kind
				end
				return vim_item
			end,
		},
		experimental = {
			ghost_text = true,
		},
		mapping = {
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif require("luasnip").expand_or_jumpable() then
					vim.fn.feedkeys(
						vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
						""
					)
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				elseif require("luasnip").jumpable(-1) then
					vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		},
	}
	vim.cmd([[highlight! PmenuSel guibg=#a22a7a]])

	return cmp.setup(options)
end

M.tabnine = function()
	local present, tabnine = pcall(require, "cmp_tabnine.config")

	if not present then
		return
	end

	tabnine.setup({
		max_lines = 1000,
		max_num_results = 20,
		sort = true,
		run_on_every_keystroke = true,
		snippet_placeholder = "..",
		ignored_file_types = { js = true, jsx = true, css = true, html = true, tsx = true },
		show_prediction_strength = true,
	})

	local prefetch = vim.api.nvim_create_augroup("prefetch", { clear = true })
	vim.api.nvim_create_autocmd("BufRead", {
		group = prefetch,
		pattern = "*",
		callback = function()
			require("cmp_tabnine"):prefetch(vim.fn.expand("%:p"))
		end,
	})
end

M.luasnip = function()
	local present, luasnip = pcall(require, "luasnip")
	if not present then
		return
	end

	local options = {
		history = true,
		updateevents = "TextChanged,TextChangedI",
	}

	luasnip.config.set_config(options)
	require("luasnip.loaders.from_vscode").lazy_load()
	require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.g.luasnippets_path or "" })

	vim.api.nvim_create_autocmd("InsertLeave", {
		callback = function()
			if
				require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
				and not require("luasnip").session.jump_active
			then
				require("luasnip").unlink_current()
			end
		end,
	})
end

return M
