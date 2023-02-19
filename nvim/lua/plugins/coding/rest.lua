local present, rest = pcall(require, "rest-nvim")

if not present then
    return
end

local opts = {
    encode_url = true,
    highlight = {
        enabled = true,
        timeout = 150,
    },
    result = {
        show_url = true,
        show_http_info = true,
        show_headers = true,
        formatters = {
            json = "jq",
            html = function(body)
                return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
        },
    },
}

rest.setup(opts)
