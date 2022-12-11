local present, rest = pcall(require, "rest-nvim")

if not present then
    return
end

local options = {
    result_split_horizontal = false,
    result_split_in_place = false,
    skip_ssl_verification = false,
    highlight = {
        enabled = true,
        timeout = 150,
    },
    result = {
        show_url = false,
        show_http_info = false,
        show_headers = true,
        formatters = {
            json = "jq",
            html = function(body)
                return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end,
        },
    },
    jump_to_request = false,
    env_file = ".env",
    custom_dynamic_variables = {},
    yank_dry_run = true,
}

rest.setup(options)
