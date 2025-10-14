local M = {}

function M.setup()
    vim.diagnostic.config({
        virtual_text = {
            current_line = false,
            prefix = '◼',
            spacing = 4,
            severity = {
                [vim.diagnostic.severity.ERROR] = {},
            }
        },
        virtual_lines = { current_line = true },
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = true,
            header = "",
        },
        signs = {
            text = {
                [1] = '◼', ['WARN'] = '◼', ['HINT'] = '◼', ['INFO'] = '◼'
            },
        },
        underline = true,
        severity_sort = true,
    })
end

return M