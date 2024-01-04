return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function()
        require("lsp_signature").setup({
            bind = true,
            doc_lines = 5,
            floating_window = true,
            fix_pos = true,
            hint_enable = true,
            hint_prefix = "🐼 ",
            hint_scheme = "String",
            hi_parameter = "Search",
            max_height = 12,
            max_width = 120,
            handler_opts = {
                border = "single",
            },
            zindex = 200,
            padding = "",
        })
    end,
}
