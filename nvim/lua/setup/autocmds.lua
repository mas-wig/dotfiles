local autocmd = vim.api.nvim_create_autocmd

local function l_augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, {clear = true})
end

local function augroup(name)
    return vim.api.nvim_create_augroup(name, {clear = true})
end

-- Reload file
autocmd({"FocusGained", "TermClose", "TermLeave"}, {
    group = l_augroup("checktime"),
    command = "checktime",
})

-- Highlight on yank
autocmd("TextYankPost", {
    group = l_augroup("highlight_yank"),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
autocmd({"VimResized"}, {
    group = l_augroup("resize_splits"),
    callback = function()
        vim.cmd("tabdo wincmd =")
    end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
    group = l_augroup("last_loc"),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- close some filetypes with <q>
autocmd("FileType", {
    group = l_augroup("close_with_q"),
    pattern = {
        "qf",
        "help",
        "man",
        "notify",
        "lspinfo",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", {buffer = event.buf, silent = true})
    end,
})

-- wrap and check for spell in text filetypes
autocmd("FileType", {
    group = l_augroup("wrap_spell"),
    pattern = {"gitcommit", "markdown"},
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

-- exclude qf buffer
autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

-- Format on save
autocmd("BufWritePost", {
    pattern = "*",
    command = "FormatWrite",
    group = augroup("FormatAutogroup"),
})

-- Remember folding
autocmd("BufWinLeave", {
    pattern = "*.*",
    group = augroup("remember_folds"),
    command = "mkview",
})

autocmd("BufWinLeave", {
    pattern = "*.*",
    group = augroup("remember_folds"),
    command = "silent! loadview",
})
