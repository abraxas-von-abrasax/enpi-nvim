return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function() _G.barbar_auto_setup = false end,
    opts = {
        animation = true,
    },
}
