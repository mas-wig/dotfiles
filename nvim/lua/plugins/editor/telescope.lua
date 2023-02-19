local M = {}

M.setup = function()
    local present, telescope = pcall(require, "telescope")
    if not present then
        return
    end

    return telescope.setup{
        defaults = {
            vimgrep_arguments = {
                "rg",
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
                "--smart-case",
            },
            prompt_prefix = " 🔎 ",
            selection_caret = "  ",
            entry_prefix = "  ",
            initial_mode = "insert",
            selection_strategy = "reset",
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                    results_width = 0.8,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.87,
                height = 0.80,
                preview_cutoff = 120,
            },
            file_sorter = require("telescope.sorters").get_fuzzy_file,
            file_ignore_patterns = {"node_modules", "assets", ".git"},
            generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
            path_display = {"truncate"},
            winblend = 0,
            border = {},
            borderchars = {"─", "│", "─", "│", "╭", "╮", "╯", "╰"},
            color_devicons = true,
            set_env = {["COLORTERM"] = "truecolor"}, -- default = nil,
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
            buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
            mappings = {
                n = {["q"] = require("telescope.actions").close},
            },
        },
        extensions = {
            media_files = {
                filetypes = {"png", "webp", "jpg", "jpeg", "mp4", "mkv", "pdf", "gif", "ico", "svg"},
                find_cmd = "rg",
            },
        },
    }

end

M.keymaps = function()
    local root_patterns = {".git", "package.json", "go.mod"}
    local function get_root()
        local path = vim.api.nvim_buf_get_name(0)
        path = path ~= "" and vim.loop.fs_realpath(path) or nil
        local roots = {}
        if path then
            for _, client in pairs(vim.lsp.get_active_clients({bufnr = 0})) do
                local workspace = client.config.workspace_folders
                local paths = workspace and vim.tbl_map(function(ws)
                    return vim.uri_to_fname(ws.uri)
                end, workspace) or client.config.root_dir and {client.config.root_dir} or {}
                for _, p in ipairs(paths) do
                    local r = vim.loop.fs_realpath(p)
                    if path:find(r, 1, true) then
                        roots[#roots + 1] = r
                    end
                end
            end
        end
        table.sort(roots, function(a, b)
            return #a > #b
        end)
        local root = roots[1]
        if not root then
            path = path and vim.fs.dirname(path) or vim.loop.cwd()
            root = vim.fs.find(root_patterns, {path = path, upward = true})[1]
            root = root and vim.fs.dirname(root) or vim.loop.cwd()
        end
        return root
    end

    local function key_telescope(builtin, opts)
        local params = {builtin = builtin, opts = opts}
        return function()
            builtin = params.builtin
            opts = params.opts
            opts = vim.tbl_deep_extend("force", {cwd = get_root()}, opts or {})
            if builtin == "files" then
                if vim.loop.fs_stat((opts.cwd or vim.loop.cwd()) .. "/.git") then
                    opts.show_untracked = true
                    builtin = "git_files"
                else
                    builtin = "find_files"
                end
            end
            require("telescope.builtin")[builtin](opts)
        end
    end

    return {
        {
            "<leader>,",
            "<cmd>Telescope buffers show_all_buffers=true<cr>",
            {desc = "Switch Buffer"},
        },
        {
            "<leader>/",
            key_telescope("live_grep"),
            {desc = "Find in Files (Grep)"},
        },
        {
            "<leader>:",
            "<cmd>Telescope command_history<cr>",
            {desc = "Command History"},
        },
        {
            "<leader><space>",
            key_telescope("files"),
            {desc = "Find Files (root dir)"},
        }, -- find
        {
            "<leader>fb",
            "<cmd>Telescope buffers<cr>",
            {desc = "Buffers"},
        },
        {
            "<leader>ff",
            key_telescope("files"),
            desc = "Find Files (root dir)",
        },
        {
            "<leader>fF",
            key_telescope("files", {
                cwd = false,
            }),
            {desc = "Find Files (cwd)"},
        },
        {
            "<leader>fr",
            "<cmd>Telescope oldfiles<cr>",
            {desc = "Recent"},
        }, -- git
        {
            "<leader>gc",
            "<cmd>Telescope git_commits<CR>",
            {desc = "commits"},
        },
        {
            "<leader>gs",
            "<cmd>Telescope git_status<CR>",
            {desc = "status"},
        }, -- search
        {
            "<leader>sa",
            "<cmd>Telescope autocommands<cr>",
            {desc = "Auto Commands"},
        },
        {
            "<leader>sb",
            "<cmd>Telescope current_buffer_fuzzy_find<cr>",
            {desc = "Buffer"},
        },
        {
            "<leader>sc",
            "<cmd>Telescope command_history<cr>",
            {desc = "Command History"},
        },
        {
            "<leader>sC",
            "<cmd>Telescope commands<cr>",
            {desc = "Commands"},
        },
        {
            "<leader>sd",
            "<cmd>Telescope diagnostics<cr>",
            {desc = "Diagnostics"},
        },
        {
            "<leader>sg",
            key_telescope("live_grep"),
            {desc = "Grep (root dir)"},
        },
        {
            "<leader>sG",
            key_telescope("live_grep", {
                cwd = false,
            }),
            {desc = "Grep (cwd)"},
        },
        {
            "<leader>sh",
            "<cmd>Telescope help_tags<cr>",
            {desc = "Help Pages"},
        },
        {
            "<leader>sH",
            "<cmd>Telescope highlights<cr>",
            {desc = "Search Highlight Groups"},
        },
        {
            "<leader>sk",
            "<cmd>Telescope keymaps<cr>",
            {desc = "Key Maps"},
        },
        {
            "<leader>sM",
            "<cmd>Telescope man_pages<cr>",
            {desc = "Man Pages"},
        },
        {
            "<leader>sm",
            "<cmd>Telescope marks<cr>",
            {desc = "Jump to Mark"},
        },
        {
            "<leader>so",
            "<cmd>Telescope vim_options<cr>",
            {desc = "Options"},
        },
        {
            "<leader>sw",
            key_telescope("grep_string"),
            {desc = "Word (root dir)"},
        },
        {
            "<leader>sW",
            key_telescope("grep_string", {
                cwd = false,
            }),
            {desc = "Word (cwd)"},
        },
        {
            "<leader>uC",
            key_telescope("colorscheme", {
                enable_preview = true,
            }),
            {desc = "Colorscheme with preview"},
        },
        {
            "<leader>ss",
            key_telescope("lsp_document_symbols", {
                symbols = {
                    "Class",
                    "Function",
                    "Method",
                    "Constructor",
                    "Interface",
                    "Module",
                    "Struct",
                    "Trait",
                    "Field",
                    "Property",
                },
            }),
            {desc = "Goto Symbol"},
        },
    }
end

return M
