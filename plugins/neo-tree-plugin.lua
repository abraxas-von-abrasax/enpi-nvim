return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim", -- Optional image support in preview window
        {
            "s1n7ax/nvim-window-picker",
            version = "2.*",
            config = function()
                local window_picker = require("window-picker")
                window_picker.setup({
                    filter_rules = {
                        include_current_win = false,
                        autoselect_one = false,
                        -- filter using buffer options
                        bo = {
                            -- if the file type is one of the following, the window will be ignored
                            filetype = { "neo-tree", "neo-tree-popup", "notify" },
                            -- if the buffer type is one of the following, the window will be ignored
                            buftype = { "terminal", "quickfix" },
                        },
                    },
                })
            end,
        },
    },
    --    config = function()
    --        require("config.neo-tree-config")
    --    end
}
