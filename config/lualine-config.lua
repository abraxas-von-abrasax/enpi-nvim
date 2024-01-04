local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
    return
end

-- LSP clients attached to buffer
local attached_lsp_clients = function()
    local bufnr = _G.vim.api.nvim_get_current_buf()
    local clients = _G.vim.lsp.buf_get_clients(bufnr)

    local client_names = {}

    for _, client in pairs(clients) do
        table.insert(client_names, client.name)
    end

    return "\u{f085} " .. table.concat(client_names, " | ")
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { statusline = {}, winbar = {} },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = { statusline = 1000, tabline = 1000, winbar = 1000 }
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename", require("pomodoro").statusline },
        lualine_x = { attached_lsp_clients, "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
})
