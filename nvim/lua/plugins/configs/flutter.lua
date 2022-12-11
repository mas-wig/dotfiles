local present, flutter = pcall(require, "flutter-tools")
if not present then
    return
end

local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

M.on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end
local opt = {
    ui = {
        border = "rounded",
        notification_style = "native",
    },
    flutter_path = "/usr/bin/flutter",
    debugger = {
        enabled = true,
        run_via_dap = true,
    },
    outline = { auto_open = false },
    decorations = {
        statusline = { device = true, app_version = true },
    },
    widget_guides = { enabled = true, debug = true },
    dev_log = { enabled = false, open_cmd = "tabedit" },
    lsp = {
        color = {
            enabled = false,
            background = true,
            virtual_text = false,
        },
        settings = {
            showTodos = true,
            renameFilesWithClasses = "prompt",
        },
        on_attach = M.on_attach,
        capabilities = M.capabilities,
    },
}

flutter.setup(opt)
return M
