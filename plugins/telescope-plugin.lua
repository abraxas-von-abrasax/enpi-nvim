return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build =
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && " ..
                "cmake --install build --prefix build",
        },
        {
            "ahmedkhalf/project.nvim",
            opts = {
                manual_mode = true,
            },
            event = "VeryLazy",
            config = function(_, opts)
                require("project_nvim").setup(opts)
                require("telescope").load_extension("projects")
            end,
        }
    },
}
