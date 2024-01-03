local status_ok, configs = pcall(require, "nvim-treesitter.configs")

if not status_ok then
    return
end

configs.setup({
    -- Add a language of your choice
    ensure_installed = { "cpp", "python", "lua", "java", "javascript", "typescript", "rust" },
    sync_install = false,
    ignore_install = { "" }, -- list of parsers to ignore installing
    highlight = {
        enable = true,       -- false will disable the whole extension
        disable = { "" },    -- list of languages that should be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, -- list of languages you want to disable
        query = "rainbow-parens",
        strategy = require("ts-rainbow.strategy.global"),
        extended_mode = true, -- also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = 3000  -- do not enable for files with more than n lines, int
        -- colors = {}, -- table or hex string
        -- termcolors = {}, -- table or color name string
    },
})
